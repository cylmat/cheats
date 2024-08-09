Repo:  
```
export HELM_VERSION=helm

helm repo add my_repo https://raw.githubusercontent.com/my-repo/helm-charts/master/repo
helm repo update
```

Sample:  
```
$HELM_VERSION upgrade --namespace=$NAMESPACE signal-backend 3slab/symfony -f values.yaml -f values-override-$ENV.yaml --version=1.8.0 --set image.tag=$IMAGE_TAG --debug
```

### upgrade

helm upgrade --namespace=env-int request-bridge remote/symfony -f values.yaml -f values-override-int.yaml --version=2.3 --set image.tag=1.0.16 --debug
