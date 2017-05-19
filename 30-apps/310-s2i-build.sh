#!/bin/bash

. $(pwd)/env.sh || exit 1

docker_cmd images
pause
s2i_cmd build --assemble-user 0 -v $DOCKER_VOL_DIR/maven:/home/jboss/.m2/repository:z $APP_URI $EAP $APP_NAME
pause
docker_cmd images

