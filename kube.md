### Exemples:

k get pod  
k get deploy  
k logs svc/api-symfony   

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
