#!/bin/sh
set -e
BASE="http://data.openphacts.org/1.5/virtuoso/"
#BASE=http://data.openphacts.org/dev/1.5/virtuoso/

mkdir -p /download
cd /download

rm -f *.sha1
# Get *.sha1 first
echo "Downloading checksums from $BASE"
wget --no-verbose --recursive --no-directories -A "*.tar*sha1" --no-parent $BASE

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

if [ "$urls" != "" ] ; then
  wget --no-verbose -A "*.tar*" $urls
fi

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
