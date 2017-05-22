#!/bin/bash

ATOMIC_HOST=${ATOMIC_HOST:-192.168.122.201}
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

RHEL=rhel7.3
COCKPIT=rhel7/cockpit-ws
EAP=jboss-eap-7/eap70-openshift
NGINX=rhscl/nginx-110-rhel7
POSTGRES=rhscl/postgresql-95-rhel7
WILDFLY=docker.io/jboss/wildfly

IMAGES="$COCKPIT $NGINX $EAP $RHEL $POSTGRES"
RHR=registry.access.redhat.com

DOCKER_VOL_DIR=/var/lib/docker/vfs
