

## Package
helm package --version 0.1.0 helm-chart -d e2e


## Install Helm

helm upgrade --install -f yaml/values.yaml hello ./helm-chart