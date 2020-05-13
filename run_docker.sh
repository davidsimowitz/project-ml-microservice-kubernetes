#!/usr/bin/env bash

# Build image and add a descriptive tag
docker build -t ml-microservice-api .

# List docker images
docker image ls

# Run flask app
docker run -p 8000:80 ml-microservice-api
