#!/bin/sh
set -e
BASE=https://data.openphacts.org/commercial/2.0/ims/
NAME=mysql-for-ims-2.0-20151214.sql.gz

url=${BASE}${NAME}

rm -f *.sha1
axel --quiet -n 1 $url.sha1 

if ! [ -f $NAME ] || ! sha1sum --status -c $NAME.sha1 2>/dev/null ; then
  axel --alternate $url
fi
sha1sum -c *.sha1

