#!/usr/bin/env bash

VERSION=$(grep "LABEL version" Dockerfile | cut -d'"' -f2)
IMAGE_VERSION="norraxx/faf-exe-upload:$VERSION"

docker push "$IMAGE_VERSION"
echo "Image build $IMAGE_VERSION"
