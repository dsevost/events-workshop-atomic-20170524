#!/bin/bash

. $(pwd)/docker-env.sh || exit 1

docker_cmd ps -a
