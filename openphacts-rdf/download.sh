#!/bin/bash
set -e

# Inherited from Dockerfile
#BASE=http://data.openphacts.org/dev/1.5/rdf/
cd /download

shas=`find -name '*.sha1'`
if [ "$shas" == "" ] ; then
  echo "Nothing to download - already finished?"
  exit 0
fi

# For every *.sha1 - download from $BASE if not existing
urls=""
for sha in $shas; do
  file=`echo $sha | sed s/.sha1$//`
  if ! [ -f $file ] || ! sha1sum --status -c $sha 2>/dev/null ; then 
    # Missing or wrong checksum, start again
    rm -f $file
    url="${BASE}${file}"
    urls="$urls $url"
  fi
done


if [ "$urls" != "" ] ; then
  echo "Downloading RDF datasets to /download"
  #wget --no-verbose -A "*.tar*" $urls
  for url in $urls; do
      axel --alternate -n8 $url
  done
fi


echo "Verifying checksums"
sha1sum -c *.sha1

echo "Extracting to /staging"
mkdir -p /staging
cd /staging
for x in /download/*tar ; do 
  echo Extracting from $x
  tar xfv $x 
  # Delete extracted tar file so it won't be downloaded+extracted again
  rm -f $x $x.sha1
done
echo "Data download complete"

