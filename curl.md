```
@https://curl.se/docs/manpage.html

--(X)request --(d)ata --(I)head --(H)eader -(k)insecure -(i)nc -(L)oc -(o)ut -v
curl -X GET -H Host:whoami.docker.localhost http://{127,128}.0.0.1 -c - --header "Accept: application/json"
curl -X POST -H Host:whoami.docker.localhost http://[120-128].0.0.1 --data "data=val" --stderr output.txt
```

### Out

("-o-" equivalent à "-o -", affiche le contenu)  
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash  

### Command line
Post with file
```
curl "$REQUEST_URL/url" \
  -H 'Connection: keep-alive' \
  -H 'accept: */*' \
  -H "Authorization: $AUTH" \
  -H 'Content-Type: application/json' \
  -d "@data/fixtures/data.json"
```

**In target dir**   
curl -fLo ~ /target/dir --create-dirs https://source-of.file

curl -sk  -X POST  "https://apiv1.exemple/medias" \
--header 'Authorization: Basic ds16q4s5q1f4sq1=' \
--header 'Accept: application/json ' \
--header 'Content-Type: multipart/form-data' \
-F 'media[file]=@"/var/www/pict.jpg";type=image/jpeg' -vv
