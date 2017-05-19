#!/bin/bash

. $(pwd)/env.sh || exit 1

exec_cmd subscription-manager register --auto-attach --force
