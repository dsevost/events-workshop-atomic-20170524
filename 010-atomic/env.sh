#!/bin/bash

. $(pwd)/../env.sh || exit 1

function atomic_cmd() {
    exec_cmd atomic $*
}
