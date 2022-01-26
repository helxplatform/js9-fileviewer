# Sterling deployment

## Using kubectl 
Deploy both the service and the ingress.

Quick summary of the (example) commands:
```
kubectl -n argus-dev apply -f js9server-service.yaml

kubectl -n argus-dev apply -f js9server-ingress.yaml
```

# Using helm
```
helm install dev js9fileviewer --values js9values.yaml --dry-run

helm upgrade --install dev js9fileviewer --values js9values.yaml

helm --namespace wstephens delete dev
```
