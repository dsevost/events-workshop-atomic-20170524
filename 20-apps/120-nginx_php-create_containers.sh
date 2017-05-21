#!/bin/bash

. $(pwd)/env.sh || exit 1

docker_cmd kill c-${APP_IMAGE}-n
docker_cmd kill c-${APP_IMAGE}-p

docker_cmd rm c-${APP_IMAGE}-n
docker_cmd rm c-${APP_IMAGE}-p

docker_cmd create \
    --name c-${APP_IMAGE}-p \
    -v $WWW_DIR:/www:ro \
    -ti $USER/$APP_IMAGE:1.0 \
	opt/rh/php55/root/usr/sbin/php-fpm --nodaemonize
pause

#    -v $WWW_DIR:/www \
#	/opt/rh/rh-nginx110/root/usr/sbin/nginx -c /www/nginx.conf
docker_cmd create \
    --name c-${APP_IMAGE}-n \
    -p 80:8080 \
    -u 0 \
    --link c-${APP_IMAGE}-p:php \
    -v $WWW_DIR/nginx.conf:/nginx.conf:ro \
    -ti $USER/$APP_IMAGE:1.0 \
	/opt/rh/rh-nginx110/root/usr/sbin/nginx -c /nginx.conf
pause

docker_cmd ps -a
