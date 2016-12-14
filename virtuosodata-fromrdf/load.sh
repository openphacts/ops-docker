#!/bin/bash
set -e

## Most statements here are debugging, to check that files in the Docker containers are where expected.
## Purpose is to move/copy file 'staging.sql' into '/staging' where the 'staging.sh' script already in
## the stain/virtuoso image will load the 'staging.sql' file.
## Ended up with 2-step process: in Dockerfile, COPY staging.sql to '/'. Then here, copy it to
## '/staging/'. Why? It worked. Direct method must have initially failed.

## ToDo: clean up, perhaps refactor how 'staging.sh' and 'staging.sql' work.

# if [ -f /staging/.staged ] ; then
#   echo "RDF is already loaded. To start again, try:"
#   echo "    docker-compose run virtuosostaging rm /staging/.staged"
#   exit 0
# fi

echo '1) ls -al /staging'
ls -al /staging

cp /staging.sql -f /staging/

echo 'Loading RDF from /staging'
tail -F /virtuoso/virtuoso.log &

echo '2) ls -al /staging'
ls -al /staging

echo 'ls -ld /usr/local/bin/isql'
ls -ld /usr/local/bin/isql

echo 'ls -ld /usr/local/bin/staging.sh'
ls -ld /usr/local/bin/staging.sh
# which staging.sh

echo 'cat /staging/staging.sql'
cat /staging/staging.sql

/usr/local/bin/staging.sh

# isql 1111 dba dba /staging/staging.sql
# rm /staging/*

# touch /staging/.staged

echo 'Loading finished'
