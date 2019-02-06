#!/usr/bin/env bash

# Check that Docker is installed
if [ ! -x "$(command -v docker)" ]; then
    echo "Could not find Docker in path. Follow the steps here to install it: https://docs.docker.com" >&2
    exit 1
fi

# Check that environment file exists.
./scripts/create-environment-file.sh

# Load environment variables.
set -a
source ./.env
set +a

# Check that Docker container exists.
./scripts/build-docker.sh

# Connect to an existing container.
CONTAINER=$(docker container ls | grep ${DOCKER_CONTAINER_NAME} | cut -c 1-12)
if [ ! $CONTAINER == "" ]; then
    echo "Connecting to running container $CONTAINER..."

    docker exec \
        -w="/root/src" \
        --interactive \
        --tty \
        $CONTAINER \
        bash

    exit 0
fi

echo "Launching Hitched API..."

COMMAND=$1
if [ ! $COMMAND ]; then
    COMMAND="/root/src/run-server.sh"
fi

docker run \
    --name ${DOCKER_CONTAINER_NAME}-container \
    --mount type=bind,source="$(pwd)/scripts",target="/root/scripts" \
    --mount type=bind,source="$(pwd)/src",target="/root/src" \
    --mount type=bind,source="$(pwd)/.env",target="/root/src/.env" \
    -w="/root/src" \
    --env-file ./.env \
    --publish $DOCKER_PORT:$DOCKER_PORT \
    --interactive \
    --rm \
    --tty \
    $DOCKER_CONTAINER_NAME:latest \
    $COMMAND
