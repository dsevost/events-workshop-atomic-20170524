#!/bin/bash

. $(pwd)/docker-env.sh || exit 1

docker_cmd start c-$MY_IMAGE
docker_cmd ps