#!/bin/bash

. $(pwd)/env.sh || exit 1

exec_cmd subscription-manager register --auto-attach --force
exec_cmd subscription-manager repos \
    --disable='*' \
    --enable=rhel-7-server-rpms \
    --enable=rhel-7-server-extras-rpms \
    --enable=rhel-7-server-optional-rpms \
    --enable=rhel-server-rhscl-7-rpms
