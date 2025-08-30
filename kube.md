- https://kubernetes.io/docs/concepts  
- https://kubernetes.io/fr/docs/reference/kubectl/cheatsheet  
   
### alias

alias kdep='f(){k get pod | grep "$@" ; unset -f f}; f'     
API_KEY=$(kubectl -n namespace-int get secrets container-secrets -o jsonpath="{.data.api-key}" | base64 --decode)  

### context

cluster
```
kubectl config set-cluster preprod-cluster --server=https://aks.azmk8s.io --certificate-authority=/tmp/ca.crt --embed-certs=true
kubectl config set-credentials preprod-dev-user --token=eyJh28ifQ.eyJpc31jeXJpbCJ9.QvK8SqpDeoR76y4r
```

context
```
kubectl config  set-context lab-dev  --cluster=dev-cluster  --user=dev-user-joe  --namespace=default
kubectl config  use-context lab-dev
```

### cronjob

create cronjob
```
kubectl create job --from=cronjob.batch/my_container cronjob_name --dry-run=client -o json |
jq '.spec.template.spec.containers[0] += { command:["tail","-f","/dev/null"] }' | kubectl create -f -
```

se connecter et supprimer:
```
kubectl exec -it job/cronjob_name -- bash
kubectl delete job/cronjob_name
```

### deploy / ingress

k get deploy   
k edit deploy <pod-service>   
kubectl edit ingress geo   
k get cronjob  

### Exemples:

```
k get pod  
k get ns  
k get po -A | grep user
k logs svc/api-symfony     
k -n user-int logs deploy/user-symfony -f --tail 100 | grep ' 500 '  
k exec -it  deploy/backend-symfony  -- bash
k exec -it svc/request-consumer-symfony -- bash  
```

```
(service)  
k logs svc/global-portal-api-symfony -f   

(deploy)  
k logs deploy/global-portal-api-symfony -f   

(SAMPLES)  
k -n user-request-int- logs user-request-xxxx  

API_KEY = $(shell kubectl -n container-int get secrets prj-secrets -o jsonpath="{.data.api-key}" | base64 --decode)
```

### install

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
   echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
   sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

### logs

```
# Multi logs with common labels
k describe pod <mypod>   -> get labels
k logs -l app.kubernetes.io/instance=mylabelinstance --max-log-requests 8 -f 
```

### Mysql deploy

```
kubectl create deployment mysql-client-deploy --image mysql-client --port=78 
```

### nginx command & cache

``` 
k exec -it deploy/global-portal-api-symfony -- su nginx -s /bin/sh -c 'bin/console cache:pool:clear cache.app' 
```

### port forward and database

to connect to an external database with application (ex Dbeaver)   
shell script to open a SOCAT socket to expose port forward 

```shell
#!/bin/bash
export NAMESPACE=default
export POSTGRES_SERVICE_NAME=postgres.database.azure.com
export CONTEXT=default
export REMOTEPORT=5432
export LOCALPORT=54320
ctrl_c() {
    echo "Ctrl+C pressed. Cleaning up..."
    kubectl --context ${CONTEXT} -n ${NAMESPACE} delete svc postgres-tunnel-$USER
    kubectl --context ${CONTEXT} -n ${NAMESPACE} delete pod postgres-tunnel-$USER
}
# Set the trap to catch SIGINT (Ctrl+C)
trap ctrl_c INT
# kubectl --context ${CONTEXT} -n ${NAMESPACE} run postgres-tunnel-$USER -it --tty --rm --image=alpine/socat --expose=true --port=$REMOTEPORT tcp-listen:$REMOTEPORT,fork,reuseaddr tcp-connect:${POSTGRES_SERVICE_NAME}:$REMOTEPORT
kubectl --context ${CONTEXT} -n ${NAMESPACE} run postgres-tunnel-$USER --image=alpine/socat --expose=true --port=$REMOTEPORT tcp-listen:$REMOTEPORT,fork,reuseaddr tcp-connect:${POSTGRES_SERVICE_NAME}:$REMOTEPORT
echo "wait 5 seconds ..."; sleep 5
kubectl --context ${CONTEXT} -n ${NAMESPACE} port-forward svc/postgres-tunnel-$USER $LOCALPORT:$REMOTEPORT
```

### Remote mysql connection

```
kubectl run --rm -it mysql-client --image=mysql:5.7 /bin/bash
# inside pod:
mysql --default-character-set=utf8 -h myhost -u "user" -ppass
```

### scale

```
kubectl scale deployment dploy-symfony --replicas=0
```

### secrets

```
k get secrets | grep porta  
k get secrets mysecretscontainer -o yaml
k apply -n env-int -f url-secret-int.yaml
k apply -f app-secrets.yaml
kubectl -n $NAMESPACE apply -f url-secret-$ENV.yaml

kubectl delete secret app-saml-secret app-server-secret
```

convert to mono-line
```
IDP_CERT=`cat cert-$ENV/server/idp.crt | tr -d '\n'`
kubectl create secret generic $APP_NAME-saml-secret --from-literal=idp.crt=''"${IDP_CERT}"'' --from-literal=sp.crt=''"${SP_CERT}"'' --from-literal=sp.key=''"${SP_KEY}"''
```
