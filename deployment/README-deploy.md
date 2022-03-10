# Sterling deployment

## Using helm
```
helm --namespace argus-dev upgrade --install argus js9fileviewer --values js9values.yaml
```

## Other
```
helm install argus-dev js9fileviewer --values js9values.yaml --dry-run

helm --namespace argus-dev delete argus
```
