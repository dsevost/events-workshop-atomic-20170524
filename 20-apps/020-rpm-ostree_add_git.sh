#!/bin/bash

. $(pwd)/env.sh || exit 1

exec_cmd rpm-ostree install git || {
    echo "-----------------------------"
    echo "Manually disable broken repos at host $ATOMIC_HOST, install packges and reboot the host"
    exit 1
}
