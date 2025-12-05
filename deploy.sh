#!/bin/bash

# Navigate to app directory
cd /home/kavindu/projects-devops/python-app-simple

# Pull latest code from Git
git pull origin main

# Build Docker image
docker build -t python-sample-app:latest .

# Stop & remove existing container if exists.
docker stop python-sample-app || true
docker rm python-sample-app || true

# Run new container
docker run -d --name python-sample-app -p 5000:5000 python-sample-app:latest

echo "Deployment successful at $(date)"
