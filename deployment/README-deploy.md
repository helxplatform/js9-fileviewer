# Sterling deployment

## Using helm
```
helm upgrade --install dev js9fileviewer --values js9values.yaml
```

## Other
```
helm install dev js9fileviewer --values js9values.yaml --dry-run

helm --namespace wstephens delete dev
```
