#!/bin/bash

. $(pwd)/env.sh || exit 1

docker_cmd exec -ti c-$MY_IMAGE 'cat /info.txt'
pause
docker_cmd exec -ti c-$MY_IMAGE "/bin/bash -c 'env > /volume/container-env.txt'"
pause
exec_cmd "cat $VOL/container-env.txt"
pause
docker_cmd exec -ti c-$MY_IMAGE ls -l /
pause
docker_cmd exec -ti c-$MY_IMAGE du -sh /
pause
docker_cmd exec -ti c-$MY_IMAGE df -h
