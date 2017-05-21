#!/bin/bash

. $(pwd)/env.sh || exit 1

curl -v "http://$ATOMIC_HOST:8080/dstest/index.jsp?submit=submit&jndiName=jboss/PostgresDS" \
    --data-urlencode "sqlString=select * from keyval"
