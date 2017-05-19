#!/bin/bash

. $(pwd)/env.sh || exit 1

atomic_cmd mount $NGINX /mnt
pause

exec_cmd ls -l /mnt/root/buildinfo
pause

atomic_cmd umount /mnt
