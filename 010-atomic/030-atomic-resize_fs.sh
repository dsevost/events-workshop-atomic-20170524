#!/bin/bash

. $(pwd)/env.sh || exit 1

exec_cmd lvresize -L 8G atomicos/root
exec_cmd xfs_growfs /

