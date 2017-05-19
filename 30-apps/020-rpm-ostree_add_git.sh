#!/bin/bash

. $(pwd)/env.sh || exit 1

exec_cmd rpm-ostree install git || {
    echo "Manually disable broken repos at host $ATOMIC_HOST"
    exit 1
}
