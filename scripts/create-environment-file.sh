#!/usr/bin/env bash

echo "Checking for environment file..."

# Check that an environment file exists.
if [ ! -f ./.env ]; then
    echo "Creating \".env\" file with default parameters..."
    touch ./.env

    echo "# Docker" >> ./.env
    echo "DOCKER_CONTAINER_NAME=hitched-api" >> ./.env
    echo "DOCKER_PORT=8080" >> ./.env
fi
