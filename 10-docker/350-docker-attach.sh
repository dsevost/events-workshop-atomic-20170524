#!/bin/bash

. $(pwd)/env.sh || exit 1

docker_cmd attach c-${MY_IMAGE}
