#!/bin/sh

BASE_DIR=$(dirname "$(readlink -f "$0")")

docker-compose -f $BASE_DIR/docker-compose.yml stop