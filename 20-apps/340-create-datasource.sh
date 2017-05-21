#!/bin/bash

. $(pwd)/env.sh || exit 1

docker_cmd exec -ti c-$APP_NAME \
    /opt/eap/bin/jboss-cli.sh -c \
	--command="\
/subsystem=datasources/data-source=PostgresDS:add\(\
jndi-name=\"java:jboss/PostgresDS\",connection-url=\"jdbc:postgresql://postgres:5432/postgres\",\
user-name=\"postgres\",password=\"postgres\",driver-name=\"postgresql\"\)"
