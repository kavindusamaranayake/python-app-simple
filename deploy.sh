#!/bin/bash

# Navigate to app directory
cd /home/username/sample-app

# Pull latest code from Git
git pull origin main

# Build Docker image
docker build -t sample-app:latest .

# Stop & remove existing container if exists
docker stop sample-app || true
docker rm sample-app || true

# Run new container
docker run -d --name sample-app -p 5000:5000 sample-app:latest

echo "Deployment successful at $(date)"
