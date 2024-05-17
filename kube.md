https://kubernetes.io/docs/concepts  
https://kubernetes.io/fr/docs/reference/kubectl/cheatsheet  
   
### Exemples:

```
k apply -f app-secrets.yaml

k get pod  
k get deploy  
k get ns  
k get ns  
k get po -A | grep user
k logs svc/api-symfony     
k -n user-int logs deploy/user-symfony -f --tail 100 | grep ' 500 '  
k exec -it   deploy/signal-backend-symfony  -- bash

k get secrets | grep porta  
k get secrets mysecretscontainer -o yaml

kubectl edit ingress geo
kubectl -n $NAMESPACE apply -f url-secret-$ENV.yaml
``` 

alias kdep='f(){k get pod | grep "$@" ; unset -f f}; f'   

```
(service)  
k logs svc/global-portal-api-symfony -f   

(deploy)  
k logs deploy/global-portal-api-symfony -f   

(SAMPLES)  
k -n user-request-int- logs user-request-xxxx  

API_KEY = $(shell kubectl -n container-int get secrets prj-secrets -o jsonpath="{.data.api-key}" | base64 --decode)
```

install
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
   echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
   sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
