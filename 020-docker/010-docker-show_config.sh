#!/bin/bash

. $(pwd)/env.sh || exit 1

exec_cmd cat /etc/sysconfig/docker{,-storage,-network} \| grep -v '^#' \| sed '/^$/d'