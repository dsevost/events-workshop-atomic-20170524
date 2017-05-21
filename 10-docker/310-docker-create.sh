#!/bin/bash

. $(pwd)/env.sh || exit 1

exec_cmd mkdir -p $VOL
docker_cmd rm c-${MY_IMAGE}
docker_cmd create --name c-${MY_IMAGE} -e MY_TEST_ENV='"This is my TEST env variable"' -v $VOL:/volume:z -ti $MY_IMAGE
