#!/bin/bash
set -e

## Inherited from Dockerfile, e.g.:
## URL_DATA_FREE=http://data.openphacts.org/free/2.1/rdf/
## URL_DATA_NONFREE=http://data.openphacts.org/non-free/2.1/rdf/

if [ -f .downloaded ] ; then 
  echo "Already downloaded, nothing more to do."
  echo "To force new download, delete /download/.downloaded"
  exit 0
fi
shas=`find -name '*.sha1'`
if [ "$shas" == "" ] ; then
  wget -e robots=off --no-verbose --recursive --no-directories -A '*.tar*sha1' --no-parent $BASE
fi
shas=`find -name '*.sha1'`

rm -f /tmp/urls
# For every *.sha1 - download from $BASE if not existing
for sha in $shas; do
  file=`echo $sha | sed s/.sha1$// | sed s,^\./,,`
  checksum=`cat $sha`
  # Rewrite in sha1sum-format
  echo "$file  $checksum" > $sha
  cat $sha1
  if ! [ -f $file ] || ! sha1sum --status -c $sha 2>/dev/null ; then 
    # Missing or wrong checksum, start again
    rm -f $file
    url="${BASE}${file}"
    echo $url >> /tmp/urls
  fi
wget -e robots=off --no-verbose --recursive --no-directories -A '*.*' --no-parent ${URL_DATA_FREE}
wget -e robots=off --no-verbose --recursive --no-directories -A '*.*' --no-parent \
     --user=${USER_NONFREE} --password=${PASSWORD_NONFREE} ${URL_DATA_NONFREE}
done


if [ -f /tmp/urls ] ; then
  echo "Downloading RDF datasets to /download"
  cat /tmp/urls
  echo
  aria2c -x8 -i /tmp/urls
fi


# echo "Verifying checksums"
# sha1sum -c *sha1

touch .downloaded
echo "Data download complete"
