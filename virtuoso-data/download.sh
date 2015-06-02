#!/bin/sh
set -e
BASE=http://data.openphacts.org/1.5/rdf/

rm -f *.sha1
# Get *.sha1 first
wget --no-verbose --recursive --no-directories -A "GO.tar*sha1" --no-parent $BASE

urls=""
for sha in *.sha1; do
  file=$(echo $sha | sed s/.sha1$//) 
  if ! [ -f $file ] || ! sha1sum --status -c $sha 2>/dev/null ; then 
    rm -f $file
    url="${BASE}${file}"
    urls="$urls $url"
  fi
done

if [ "$urls" != "" ] ; then
  wget --no-verbose -A "GO.tar*" $urls
fi

sha1sum -c *.sha1

mkdir -p /staging
for x in /download/*tar.xz ; do 
  tar xfv $x 
done

