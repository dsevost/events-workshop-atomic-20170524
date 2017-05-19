#!/bin/bash

. $(pwd)/../env.sh || exit 1

function docker_cmd() {
    exec_cmd docker $*
}

function s2i_cmd() {
    exec_cmd /usr/local/bin/s2i $*
}

APP_NAME=eap-6-pg-test

APP_URI=https://github.com/dsevost/$APP_NAME

APP_IMAGE=nginx-php
WWW_DIR=$DOCKER_VOL_DIR/www
