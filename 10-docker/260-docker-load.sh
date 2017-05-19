#!/bin/bash

. $(pwd)/env.sh || exit 1

docker_cmd load -i $TMP_DIR/${MY_IMAGE}.tar
docker_cmd images
