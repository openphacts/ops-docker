#!/bin/bash
set -e

# if [ -f /staging/.staged ] ; then
#   echo "RDF is already loaded. To start again, try:"
#   echo "    docker-compose run virtuosostaging rm /staging/.staged"
#   exit 0
# fi

cp /staging.sql /staging/

echo 'Loading RDF from /staging'
tail -F /virtuoso/virtuoso.log &

echo 'ls -al /staging'
ls -al /staging

echo 'ls -ld /usr/local/bin/isql'
ls -ld /usr/local/bin/isql

echo 'ls -ld /usr/local/bin/staging.sh'
ls -ld /usr/local/bin/staging.sh
# which staging.sh

/usr/local/bin/staging.sh

# isql 1111 dba dba /staging/staging.sql
# rm /staging/*

# touch /staging/.staged

echo 'Loading finished'
