#!/bin/bash

. $(pwd)/env.sh || exit 1

docker_cmd exec -ti c-postgres bash -c psql
