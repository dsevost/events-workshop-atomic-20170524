#!/bin/bash

. $(pwd)/env.sh || exit 1

docker_cmd start c-${APP_IMAGE}-p
docker_cmd start c-${APP_IMAGE}-n

docker_cmd ps
