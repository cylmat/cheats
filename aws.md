# AWS

### lambda function

```
import axios from "axios"
import {S3Client, paginateListBuckets, paginateListObjectsV2, GetObjectCommand} from '@aws-sdk/client-s3';

// @https://docs.aws.amazon.com/sdk-for-javascript/v3/developer-guide/getting-started.html
const s3client = new S3Client({ region: 'eu-west-3' }); 

// When S3 bucket send event to lambda, this is the event body
/*array (
  '{"Records":_{"eventVersion":"2_1","eventSource":"aws:s3","awsRegion":"eu-west-3","eventTime":"18:54:38_999Z","eventName":"ObjectCreated:Put","userIdentity":{"principalId":"AWS:ARO"},"requestParameters":{"sourceIPAddress":"10_143"},"responseElements":{"x-amz-request-id":"10DZ","x-amz-id-2":"HlwHArs' => '"},"s3":{"s3SchemaVersion":"1.0","configurationId":"call-lambda-email","bucket":{"name":"stockage-ses","ownerIdentity":{"principalId":"A3"},"arn":"arn:aws:s3:::stockage-email-ses"},"object":{"key":"import/p5qr1","size":6222,"eTag":"0e2b155","sequencer":"006F8"}}}]}',
)*/


export const handler = async (event, context) => {
    try {
    

    for (const record of event.Records) {
        const bucket = record.s3.bucket.name
        const key = decodeURIComponent(record.s3.object.key.replace(/\+/, ' '))
        
        const params = {
          Bucket: bucket,
          Key: key
        }
        const s3Response = await s3client.send(
          new GetObjectCommand(params)
        )

        const body = await s3Response.Body?.transformToString(); //.toString('utf-8'); 

        await axios.post("https://myresponsehost.com/api.php", JSON.stringify({
          "params": params,
          "body":body
        }))
          
        console.log('body', body);
      }
       
    } catch (err) {
        console.error('AXIOS ERROR', err)
    }
      return "ok4"
   
    // throw new Error('Something went wrong');
}

    return   {
        statusCode: 201,
        headers: {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*"
        },
        body: JSON.stringify({
            message: 'Go Serverless v1.0! Your function executed successfully!',
            postBody: JSON.parse(event.body),
            getParams: (event.queryStringParameters)
        })
    }
    // throw new Error('Something went wrong');
};
```

### SES emails redirection (Mod'op)

```
Email vers myemail@aws.domain.com
  -> Ovh (@aws.domain.com)
  -> Ovh redirection MX vers Aws
  -> Règles SES
     > vers S3 bucket (avec autorisation Write)
     > vers lambda
     > redirection email vérifiée
```

1. Configurer une identité (domain)

2. Creer le sous domain "aws".mydomain.com dans Ovh
   (La redirection s'applique à tous les emails de ce domain)

4. Placer les 3 CNAME dans Ovh pour aws.mydomain.com

(attention aux doublons aws.mydomain.com.mydomain.com)
```
375upx6f._domainkey.aws.mydomain.com IN CNAME 375upx6f.dkim.amazonses.com.
  et
_dmarc.host.fr.    0 	DMARC 	v=DMARC1; p=none; aspf=r
```

4. Ajouter un label MX dans la même région ex: eu-west-3 (important !)

https://docs.aws.amazon.com/fr_fr/ses/latest/dg/receiving-email-mx-record.html
```
aws.mydomain.fr.     0 	MX 	10 inbound-smtp.eu-west-3.amazonaws.com.
```

5. Ajouter des actions loggées dans CloudWatch

Chercher dans "CW-groupe de journaux"
- Fonction Lambda (avec configuration Allow: logs:PutLogEvents)
- Créer un nouveau Bucket S3 (configuration automatque des Authorization "Action": "s3:PutObject")
    + ajouter une "propriété" Consignation des accès au serveur
