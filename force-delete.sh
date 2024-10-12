for app in $(kubectl get applications -n argocd --output=jsonpath={.items..metadata.name}); do \
  echo $app && \
  kubectl patch app -n argocd $app  --type json -p='[{"op": "remove", "path": "/metadata/finalizers"}]'; \
  kubectl delete $app -n argocd; \
done