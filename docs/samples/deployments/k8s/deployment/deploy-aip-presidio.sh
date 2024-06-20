#!/bin/bash

# You'll want to change your kubectl context to point to dev or preprod or prod before running this script.


REGISTRY=${1:-mcr.microsoft.com}
TAG=${2:-latest}
RELEASE=${3:-basic}

# helm install $RELEASE --set registry=$REGISTRY,tag=$TAG ../charts/presidio --namespace presidio
# replaced by the following for our custom setup
# helm install $RELEASE --set registry=$REGISTRY,tag=$TAG ../charts/presidio.aip --namespace default
# replaced by the following to make it easier to rerun it. If it's running it will upgrade. If not, it just installs.
helm upgrade -i $RELEASE --set registry=$REGISTRY,tag=$TAG ../charts/presidio.aip --namespace default
