#!/usr/bin/env bash

# This file tags and uploads an image to Docker Hub
# Assumes that an image is built via `run_docker.sh`

# Create dockerpath
dockerpath=ml-microservice-api

# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username davidsimowitz
docker tag ml-microservice-api davidsimowitz/ml-microservice-api:1.1

# Push image to a docker repository
docker push davidsimowitz/ml-microservice-api:1.1
