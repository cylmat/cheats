```
@https://curl.se/docs/manpage.html

--(X)request --(d)ata --(I)head --(H)eader -(k)insecure -(i)nc -(L)oc -(o)ut -v
curl -X GET -H Host:whoami.docker.localhost http://{127,128}.0.0.1 -c - --header "Accept: application/json"
curl -X POST -H Host:whoami.docker.localhost http://[120-128].0.0.1 --data "data=val" --stderr output.txt
```

### Out

("-o-" equivalent à "-o -", affiche le contenu)  
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash  

