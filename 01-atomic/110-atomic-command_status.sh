#!/bin/bash

. $(pwd)/atomic-env.sh || exit 1

atomic_cmd host status
