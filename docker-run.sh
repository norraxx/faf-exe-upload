#!/usr/bin/env bash

VERSION=$(grep "LABEL version" Dockerfile | cut -d'"' -f2)
IMAGE_VERSION="faforever/faf-exe-upload:$VERSION"

docker stop faf-exe-upload
docker rm faf-exe-upload
docker run -d --restart=always --name faf-exe-upload -p 13667:13667 $IMAGE_VERSION
echo "Container started $IMAGE_VERSION"
