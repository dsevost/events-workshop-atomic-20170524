#!/bin/bash

. $(pwd)/env.sh || exit 1

docker_cmd logs c-${MY_IMAGE}
