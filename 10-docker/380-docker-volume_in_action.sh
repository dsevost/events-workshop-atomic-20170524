#!/bin/bash

. $(pwd)/docker-env.sh || exit 1

docker_cmd run --rm -ti ${MY_IMAGE} ip a sh
pause

docker_cmd run --rm -ti -v /usr/sbin:/usr/sbin ${MY_IMAGE} ip a sh

