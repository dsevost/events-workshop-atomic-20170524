#!/bin/bash

. $(pwd)/env.sh || exit 1

docker_cmd tag ${MY_IMAGE}:1.0 ${MY_IMAGE}:latest
