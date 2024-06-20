#!/bin/bash

# Check if IMAGE_TAG and DOCKER_USERNAME are set
if [[ -z "${IMAGE_TAG}" ]]; then
  echo "Error: IMAGE_TAG environment variable is not set."
  exit 1
fi

if [[ -z "${DOCKER_USERNAME}" ]]; then
  echo "Error: DOCKER_USERNAME environment variable is not set."
  exit 1
fi

# Use IMAGE_TAG environment variable to pull specific image
docker pull "${DOCKER_USERNAME}/sgproject:admin_frontend-${IMAGE_TAG}"
docker pull "${DOCKER_USERNAME}/sgproject:studio_ghibli_frontend-${IMAGE_TAG}"
docker pull "${DOCKER_USERNAME}/sgproject:gateway-${IMAGE_TAG}"
docker pull "${DOCKER_USERNAME}/sgproject:courses-${IMAGE_TAG}"
docker pull "${DOCKER_USERNAME}/sgproject:enrollment-${IMAGE_TAG}"
docker pull "${DOCKER_USERNAME}/sgproject:customers-${IMAGE_TAG}"
docker pull "${DOCKER_USERNAME}/sgproject:users-${IMAGE_TAG}"

# Stop and remove containers if they exist
docker stop admin_frontend || true
docker stop studio_ghibli_frontend || true
docker stop gateway || true
docker stop courses || true
docker stop enrollment || true
docker stop customers || true
docker stop users || true

docker rm admin_frontend || true
docker rm studio_ghibli_frontend || true
docker rm gateway || true
docker rm courses || true
docker rm enrollment || true
docker rm customers || true
docker rm users || true

# Run containers with mapped ports
docker run -d -p 8080:3000 --name admin_frontend "${DOCKER_USERNAME}/sgproject:admin_frontend-${IMAGE_TAG}"
docker run -d -p 80:80 --name studio_ghibli_frontend "${DOCKER_USERNAME}/sgproject:studio_ghibli_frontend-${IMAGE_TAG}"
docker run -d -p 8880:8880 --name gateway "${DOCKER_USERNAME}/sgproject:gateway-${IMAGE_TAG}"
docker run -d -p 8884:8884 --name courses "${DOCKER_USERNAME}/sgproject:courses-${IMAGE_TAG}"
docker run -d -p 8883:8883 --name enrollment "${DOCKER_USERNAME}/sgproject:enrollment-${IMAGE_TAG}"
docker run -d -p 8882:8882 --name customers "${DOCKER_USERNAME}/sgproject:customers-${IMAGE_TAG}"
docker run -d -p 8881:8881 --name users "${DOCKER_USERNAME}/sgproject:users-${IMAGE_TAG}"
