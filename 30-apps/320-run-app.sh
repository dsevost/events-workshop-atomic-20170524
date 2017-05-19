#!/bin/bash

. $(pwd)/env.sh || exit 1

docker_cmd kill c-$APP_NAME
docker_cmd rm c-$APP_NAME
docker_cmd run -d --name c-$APP_NAME -p 8080:8080 $APP_NAME
docker_cmd logs -f c-$APP_NAME
