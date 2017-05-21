#!/bin/bash

. $(pwd)/env.sh || exit 1

docker_cmd kill c-postgres
docker_cmd rm c-postgres
docker_cmd create -e POSTGRESQL_ADMIN_PASSWORD=postgres --name c-postgres $POSTGRES
