#!/bin/sh
set -e
BASE=http://data.openphacts.org/1.5/rdf/

rm -f *.sha1
# Get *.sha1 first
wget --no-verbose --recursive --no-directories -A sha1 --no-parent $BASE

urls=""
for sha in *.sha1; do
  file=$(echo $sha | sed s/.sha1$//) 
  if ! [ -f $file ] || ! sha1sum --status -c $sha 2>/dev/null ; then 
    rm -f $file
    url="${BASE}${file}"
    urls="$urls $url"
  fi
done

wget --no-verbose --show-progress $urls

sha1sum -c *.sha1

