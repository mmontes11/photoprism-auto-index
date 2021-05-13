#!/usr/bin/env bash

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

tag=$(git describe --abbrev=0 --tags)
image="$DOCKER_USERNAME/photoprism-auto-index"
platform="linux/arm64"

echo "🏗    Building '$image'. Context: '$path'"
docker buildx create --name "$name" --use --append
docker buildx build --platform "$platform" -t "$image:$tag" -t "$image:latest" --push .
docker buildx imagetools inspect "$image:latest"
