#!/bin/bash

. $(pwd)/env.sh || exit 1

atomic_cmd scan $RHEL
atomic_cmd scan $EAP
