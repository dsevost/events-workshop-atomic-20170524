#!/bin/bash

. $(pwd)/env.sh || exit 1

set -x

exec_cmd rm -rf $WWW_DIR/../www
exec_cmd mkdir -p $WWW_DIR/data
exec_cmd ls -alZ $DOCKER_VOL_DIR
cat sample-nginx.conf | exec_cmd "cat - > /tmp/nginx.conf"
exec_cmd mv /tmp/nginx.conf $WWW_DIR
cat sample-index.php | exec_cmd "cat - > /tmp/index.php"
exec_cmd mv /tmp/index.php $WWW_DIR/data
exec_cmd restorecon -R $WWW_DIR
exec_cmd ls -lR $WWW_DIR
pause