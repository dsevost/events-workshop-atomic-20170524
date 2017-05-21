#!/bin/bash

. $(pwd)/env.sh || exit 1

if [ -z "$1" ] ; then
    docker_cmd volume ls
else
    docker_cmd volume inspect $1
fi

