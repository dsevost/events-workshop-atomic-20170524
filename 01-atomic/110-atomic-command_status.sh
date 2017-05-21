#!/bin/bash

. $(pwd)/env.sh || exit 1

atomic_cmd host status
