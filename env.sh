#!/bin/bash

ATOMIC_HOST=192.168.122.173
ATOMIC_USER=cloud-user

function exec_cmd() {
    local cmd="$*"

    clear
    echo -e "$cmd\n--------------------"
    LANG=en_US ssh -qt $ATOMIC_USER@$ATOMIC_HOST sudo $cmd
}

function pause() {
    local a

    echo
    read -p "Press <Enter>: " a
}

NGINX=rhscl/nginx-110-rhel7
COCKPIT=rhel7/cockpit-ws
EAP=jboss-eap-7/eap70-openshift
WILDFLY=docker.io/jboss/wildfly
RHEL=rhel7.3

IMAGES="$COCKPIT $NGINX $EAP $RHEL"
RHR=registry.access.redhat.com

DOCKER_VOL_DIR=/var/lib/docker/vfs
