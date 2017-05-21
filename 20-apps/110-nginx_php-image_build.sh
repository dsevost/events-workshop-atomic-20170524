#!/bin/bash

. $(pwd)/env.sh || exit 1

DOCKERFILE=/tmp/nginx.dockerfile

cat > $DOCKERFILE << EOF
FROM rhel7.3

MAINTAINER dmitry sevostyanov

RUN \\
    yum clean all && \\
    yum install -y \\
	--disablerepo=\\* \\
	--enablerepo=rhel-7-server-rpms \\
	--enablerepo=rhel-7-server-extras-rpms \\
	--enablerepo=rhel-7-server-optional-rpms \\
	--enablerepo=rhel-server-rhscl-7-rpms \\
	rh-nginx110 \\
	php55-php-fpm

RUN \\
    sed -ci.bak1 '\
	/listen.*9000/s/127.0.0.1/0.0.0.0/ ; \
	s/^listen.allowed_clients/;listen.allowed_clients/ \
    ' /opt/rh/php55/root/etc/php-fpm.d/www.conf ; \
    sed -ci.bask1 '\
	/pid = .*/d \
    ' /opt/rh/php55/root/etc/php-fpm.conf


USER apache

EOF

cat $DOCKERFILE | exec_cmd "cat - > $DOCKERFILE"

docker_cmd build -t $USER/${APP_IMAGE}:1.0 -f $DOCKERFILE /tmp
