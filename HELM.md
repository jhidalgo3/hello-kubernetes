

## Package
helm package --version 0.1.0 helm-chart -d e2e


## Install Helm
helm3 upgrade --install -f values.yaml hello ./helm-chart-0.1.0.tgz