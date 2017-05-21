#!/bin/bash

. $(pwd)/env.sh || exit 1

S2I_REPO="https://github.com/openshift/source-to-image/releases/download"
S2I_VER=v1.1.6

S2I=${1:-"source-to-image-v1.1.6-f519129-linux-amd64.tar.gz"}

exec_cmd curl -L -o /tmp/s2i.tar.gz $S2I_REPO/$S2I_VER/$S2I
pause
exec_cmd tar -C /usr/local/bin -xzvf /tmp/s2i.tar.gz ./s2i
pause
s2i_cmd -h
