# AWS

### lambda function

```
console.log('Loading function');

export const handler = async (event, context) => {
    //console.log('Received event:', JSON.stringify(event, null, 2));
    console.log('value1 =', event.key1);
    console.log('value2 =', event.key2);
    console.log('value3 =', event.key3);

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
