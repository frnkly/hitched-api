#!/usr/bin/env bash

# Make sure environment file exists.
./scripts/create-environment-file.sh

# Load environment file.
set -a
source ./.env
set +a

echo "Checking for \"$DOCKER_CONTAINER_NAME\" Docker container..."

# Check if Docker container already exists.
if [ ! "$(docker image inspect $DOCKER_CONTAINER_NAME 2> /dev/null)" == "[]" ]
then
    exit 0
fi

echo "Creating Docker container..."

# Builds the Docker container
docker build \
    --tag $DOCKER_CONTAINER_NAME \
    --force-rm \
    .
