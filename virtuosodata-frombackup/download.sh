#!/bin/sh
set -e

mkdir -p /download
cd /download

rm -f *.sha1
# Get *.sha1 first
echo "Downloading checksums from $BASE"
wget -e robots=off --no-verbose --recursive --no-directories -A "*.tar*sha1" --no-parent $BASE

echo "Checking /download"
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
## DISABLED as axel in Ubuntu 14.04 does not support https
#for url in $urls ; do
#  axel --alternate --num-connections=6 $url
#done
if [ "$urls" != "" ] ; then
  wget -A "*.tar*" $urls
fi
echo "Downloaded."

echo "Verifying checksums"

# Assuming Maven repository-style sha1 files
# without filenames or newline
for sha in *.sha1 ; do 
	(cat $sha ; echo " $sha" | sed "s/.sha1//" ) | sha1sum -c - 
done


echo "Extracting to /virtuoso"
for x in /download/*tar ; do
  rm -rf /virtuoso/1
  mkdir /virtuoso/1
  cd /virtuoso/1
  tar xfv $x
  cd */data/..
  sha1sum -c tagmanifest-sha1.txt manifest-sha1.txt
  mv data/*.bp /virtuoso
  cd /virtuoso
  rm -rf $x /virtuoso/1
done
cd /virtuoso
echo "Data download complete"
