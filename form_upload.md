# FORM and Files

## application/x-www-form-urlencoded
```
curl -X POST -k \
-H 'Content-Type: application/x-www-form-urlencoded' \
--header 'Accept: application/json \
-i 'https://local/api/user/orders/contact' \
--data 'message=beta&subject=alpha' \
   or
--data-urlencode 'message=coucou'
--data-urlencode 'subject=alpha'
```
(must encode file in base64 if used)

```
POST /test HTTP/1.1
Host: foo.example
Content-Type: application/x-www-form-urlencoded
Content-Length: 27

field1=value1&field2=value2
```

## multipart/form-data

```
POST /test HTTP/1.1
Host: foo.example
Content-Type: multipart/form-data;boundary="boundary"

--boundary
Content-Disposition: form-data; name="field1"

value1
--boundary
Content-Disposition: form-data; name="field2"; filename="example.txt"

value2
--boundary--
```
