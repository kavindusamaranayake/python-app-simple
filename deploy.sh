#!/bin/bash

PROJECT_DIR="/home/kavindu/projects-devops/python-app-simple"
DOCKER_IMG="python-sample-app"
IMG_TAG="latest"
CONTAINER_NAME="python-sample-app"

# Navigate to app directory
cd $PROJECT_DIR

# Pull latest code from Git
git pull origin main

# Build Docker image
docker build -t $DOCKER_IMG:$IMG_TAG .

# Stop & remove existing container if exists.
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Run new container
docker run -d --name $CONTAINER_NAME -p 5002:5000 $DOCKER_IMG:$IMG_TAG

echo "Deployment successful at $(date)"
