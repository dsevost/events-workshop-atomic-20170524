#!/bin/bash

. $(pwd)/env.sh || exit 1

for d in \
    /sysroot/ostree/deploy/rhel-atomic-host/deploy/\* \
    /boot/loader/entries/ostree-rhel-atomic-host-\*.conf \
    /boot/ostree/rhel-atomic-host-\* \
    /sysroot/ostree/deploy/rhel-atomic-host/var \
    ; do

    exec_cmd ls -l $d
    pause
done

