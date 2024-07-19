#!/bin/bash

# Set variables
export CI_REGISTRY_IMAGE=$CI_REGISTRY_IMAGE
export CI_COMMIT_SHORT_SHA=$CI_COMMIT_SHORT_SHA

# Pull the latest image
docker pull $CI_REGISTRY_IMAGE:$CI_COMMIT_SHORT_SHA

# Update the image in docker-compose.yml
sed -i "s|image: .*|image: $CI_REGISTRY_IMAGE:$CI_COMMIT_SHORT_SHA|g" docker-compose.yml

# Display the composed file with variables replaced
docker-compose config

# Start or update the services
docker-compose up -d

# # Optional: Remove unused images and volumes
# docker image prune -f
# docker volume prune -f