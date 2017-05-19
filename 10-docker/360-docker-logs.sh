#!/bin/bash

. $(pwd)/docker-env.sh || exit 1

docker_cmd logs c-${MY_IMAGE}
