#!/bin/bash

. $(pwd)/env.sh || exit 1

docker_cmd save $MY_IMAGE -o $TMP_DIR/${MY_IMAGE}.tar
exec_cmd ls -l $TMP_DIR
