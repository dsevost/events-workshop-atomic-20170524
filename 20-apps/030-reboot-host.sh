#!/bin/bash

. $(pwd)/env.sh || exit 1

exec_cmd systemctl reboot
