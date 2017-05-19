#!/bin/bash

. $(pwd)/env.sh || exit 1

for i in $IMAGES ; do
    atomic_cmd pull $RHR/$i
done

atomic_cmd pull $WILDFLY
