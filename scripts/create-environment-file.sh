#!/usr/bin/env bash

# Check that an environment file exists.
if [ ! -f ./.env ]; then
    echo "Creating \".env\" file with default parameters..."
    touch ./.env

    echo "# Lumen app" >> ./.env
    echo "APP_ENV=local" >> ./.env
    echo "APP_KEY=\"\"" >> ./.env
    echo "APP_DEBUG=true" >> ./.env
    echo "APP_LOG=daily" >> ./.env
    echo "APP_LOG_LEVEL=DEBUG" >> ./.env
    echo "APP_URL=" >> ./.env

    echo "" >> ./.env
    echo "# Cache" >> ./.env
    echo "CACHE_DRIVER=file" >> ./.env

    echo "" >> ./.env
    echo "# Docker" >> ./.env
    echo "DOCKER_CONTAINER_NAME=hitched-api" >> ./.env
    echo "DOCKER_PORT=8080" >> ./.env

    echo "" >> ./.env
    echo "# Google APIs" >> ./.env
    echo "GOOGLE_CLIENT_ID=\"\"" >> ./.env
    echo "GOOGLE_CLIENT_SECRET=\"\"" >> ./.env

    echo "" >> ./.env
    echo "# Session" >> ./.env
    echo "SESSION_DRIVER=file" >> ./.env

    echo "" >> ./.env
    echo "# Miscellaneous" >> ./.env
    echo "BROADCAST_DRIVER=log" >> ./.env
    echo "QUEUE_DRIVER=sync" >> ./.env
fi
