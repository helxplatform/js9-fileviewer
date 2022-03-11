# Sterling deployment

## Using helm
```
helm --namespace argus-dev upgrade --install argus js9fileviewer --values js9-dev-values.yaml
```

## Other
```
helm install argus-dev js9fileviewer --values js9-dev-values.yaml --dry-run

helm --namespace argus-dev delete argus
```

## Production Helm
```
helm --namespace argus-prod upgrade --install argus js9fileviewer --values js9-prod-values.yaml
```
