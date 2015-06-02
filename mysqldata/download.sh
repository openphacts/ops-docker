#!/bin/sh
set -e
BASE=http://data.openphacts.org/1.5/ims/
NAME=ims-1.5-20150519.sql.gz

url=${BASE}${NAME}

rm -f *.sha1
wget --no-verbose $url.sha1 $url
sha1sum -c *.sha1

