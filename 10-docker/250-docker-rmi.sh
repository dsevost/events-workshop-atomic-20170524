#!/bin/bash

. $(pwd)/env.sh || exit 1

docker_cmd rmi $MY_IMAGE ${MY_IMAGE}:1.0
docker_cmd images

