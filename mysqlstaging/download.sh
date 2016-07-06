#!/bin/sh
set -e
BASE=https://data.openphacts.org/free/2.0/ims/
NAME=mysql-for-ims-2.0-20151214.sql.gz

url=${BASE}${NAME}

rm -f *.sha1
#axel --alternate $url.sha1 
wget $url.sha1 

if ! [ -f $NAME ] || ! sha1sum --status -c $NAME.sha1 2>/dev/null ; then
  #axel --alternate $url
  wget $url
fi

name=`echo *.sha1 | sed s/.sha1//`
(cat *.sha1 ; echo "  $name") | sha1sum -c  -

