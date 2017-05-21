#!/bin/bash

. $(pwd)/env.sh || exit 1

docker_cmd images
#
# to run as uprivileged mode create maven directory ans set owned
#
exec_cmd mkdir -p $DOCKER_VOL_DIR/maven
exec_cmd chown 185 -R $DOCKER_VOL_DIR/maven
pause
#
# to run as privileged mode pass '--assemble-user 0' parameter to builder
#s2i_cmd build --assemble-user 0 -v $DOCKER_VOL_DIR/maven:/home/jboss/.m2/repository:z $APP_URI $EAP $APP_NAME
s2i_cmd build -v $DOCKER_VOL_DIR/maven:/home/jboss/.m2/repository:z $APP_URI $EAP $APP_NAME
pause
docker_cmd images
