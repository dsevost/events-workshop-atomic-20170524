#!/bin/bash

. $(pwd)/env.sh || exit 1

DOCKERFILE=/tmp/${MY_IMAGE}.dockerfile

cat > $DOCKERFILE << EOF
FROM rhel7.3
MAINTAINER $USER

RUN \
    echo "My first Docker image" > /info.txt
EOF

cat $DOCKERFILE | exec_cmd "cat - > $DOCKERFILE"

docker_cmd build -t ${MY_IMAGE}:1.0 -f $DOCKERFILE /tmp
