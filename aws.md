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

### SES (Mod'op)

1. Configurer une identité (domain)

2. Creer le sous domain "aws".mydomain.com dans Ovh

3. Placer les 3 CNAME dans Ovh pour aws.mydomain.com

(attention aux doublons aws.mydomain.com.mydomain.com)
```
375upx6f._domainkey.aws.mydomain.com IN CNAME 375upx6f.dkim.amazonses.com.
  et
_dmarc.host.fr.    0 	DMARC 	v=DMARC1; p=none; aspf=r
```

4. 
