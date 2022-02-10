#!/bin/sh

REDIS_VERSION=$1
REDIS_PORT_RANGE=$2
REDIS_CONTAINER_NAME=$3

if [ -z "$REDIS_VERSION" ]; then
  echo "Missing Redis version in the [redis-version] input. Received value: $REDIS_VERSION"
  echo "Falling back to Redis version [latest]"
  REDIS_VERSION='latest'
fi

echo "Starting single-node Redis instance"
docker run --name $REDIS_CONTAINER_NAME -e INITIAL_PORT=6379 -e IP=0.0.0.0 --publish $REDIS_PORT_RANGE:6379-6399 --detach docker.io/grokzen/redis-cluster:$REDIS_VERSION
