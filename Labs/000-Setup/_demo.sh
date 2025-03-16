#!/bin/bash

# Download and install Helm Chart (Helm3)
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod +x get_helm.sh
./get_helm.sh

# Create a new Helm chart directory
mkdir -p helm-chart
cd helm-chart

# Initialize a new Helm chart
helm create mychart

# View the chart directory structure
tree mychart

