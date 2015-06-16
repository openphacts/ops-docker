#!/bin/sh
set -e

mkdir -p /download
cd /download

rm -f *.sha1
# Get *.sha1 first
echo "Downloading checksums from $BASE"
wget -e robots=off --no-verbose --recursive --no-directories -A "*.tar*sha1" --no-parent $BASE

urls=""
for sha in *.sha1; do
  file=`echo $sha | sed s/.sha1$//`
  if ! [ -f $file ] || ! sha1sum --status -c $sha 2>/dev/null ; then
    rm -f $file
    url="${BASE}${file}"
    urls="$urls $url"
  fi
done

echo "Downloading Virtuoso backup set to /download"

# axel gives ~4 times (2MB/s -> 10 MB/s) faster downloads 
# using 6 connections and http range requests
# 
# In a rush? Try --num-connection=40 and
# you might get 50 MB/s
for url in $urls ; do
  axel --alternate --num-connections=6 $url
done
#if [ "$urls" != "" ] ; then
#  wget -A "*.tar*" $urls
#fi

echo "Verifying checksums"
sha1sum -c *.sha1

echo "Extracting to /virtuoso"
mkdir /virtuoso/1
cd /virtuoso/1
for x in /download/*tar ; do
  tar xfv $x
  mv */*.bp ..
done
cd /virtuoso
rm -rf /virtuoso/1
echo "Data download complete"
