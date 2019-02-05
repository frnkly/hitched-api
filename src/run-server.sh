#!/usr/bin/env bash

PORT=$DOCKER_PORT

if [ ! $PORT ]; then
    PORT=8000
fi

# Runs the API using the built-in PHP server.
cd /root/src
php -S 0.0.0.0:$PORT -t public
