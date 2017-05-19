#!/bin/bash

. $(pwd)/docker-env.sh || exit 1

docker_cmd attach c-${MY_IMAGE}
