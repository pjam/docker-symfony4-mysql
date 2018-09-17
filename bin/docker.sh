#!/usr/bin/env bash

if [ "$1" == "build" ]; then
    docker-compose build
elif [ "$1" == "start" ]; then
    docker-compose up -d
elif [ "$1" == "stop" ]; then
    docker-compose stop
elif [ "$1" == "clean" ]; then
    docker-compose down
else
    echo "Unknown docker/docker-compose command $1"
fi
