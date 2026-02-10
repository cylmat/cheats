to see throught a list a json elements: 
```
kubectl get pods -o json | from json | get items | get 0 | get spec | column
```

to filter elements 
```
kubectl get pods -o json | from json | get items | where status.phase != 'Running' 
```
