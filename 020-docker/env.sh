#!/bin/bash

. $(pwd)/../env.sh || exit 1

function docker_cmd() {
    exec_cmd docker $*
}

MY_IMAGE=docker-build-test

VOL=$DOCKER_VOL_DIR/$MY_IMAGE

TMP_DIR=/var/local
