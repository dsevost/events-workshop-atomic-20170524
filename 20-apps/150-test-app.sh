#!/bin/bash

. $(pwd)/env.sh || exit 1

set -x

curl http://$ATOMIC_HOST/index.php
