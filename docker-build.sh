#!/usr/bin/env bash

VERSION=$(grep "LABEL version" Dockerfile | cut -d'"' -f2)
IMAGE_VERSION="faforever/faf-exe-upload:$VERSION"

docker build --rm=true --tag=$IMAGE_VERSION .
echo "Image build $IMAGE_VERSION"
