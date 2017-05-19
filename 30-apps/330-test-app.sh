#!/bin/bash

. $(pwd)/env.sh || exit 1

curl http://$ATOMIC_HOST:8080/dstest/index.jsp
