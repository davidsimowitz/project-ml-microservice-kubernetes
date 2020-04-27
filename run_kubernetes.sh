#!/usr/bin/env bash

# Reference: https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=ml-microservice-api

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment ml-microservice-api --image=davidsimowitz/ml-microservice-api:1.1

# Step 3:
# List kubernetes pods
kubectl get pods -o wide

# Step 4:
# Forward the container port to a host
kubectl expose deployment ml-microservice-api --type=LoadBalancer --port=80

# Once the pod is up and running, run ./run_kubernetes.sh again to
# display the kubernetes service URL in the CLI. The HOST and PORT
# from the output will be used as command line arguments in to the
# ./make_prediction.sh script:
#
# USAGE:
# $ ./make_prediction [HOST] [PORT]
#
# EXAMPLE:
# $ ./make_prediction 192.168.245.3 30611
minikube service ml-microservice-api --url=true
