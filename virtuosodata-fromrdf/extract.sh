#!/bin/bash
set -e

echo "Extracting to /staging"
# mkdir -p /staging
cd /staging
for x in /download/*tar ; do
  echo Extracting from $x
  tar xfv $x
  # Delete extracted tar file so it won't be downloaded+extracted again
  # rm -f $x $x.sha1
done

touch .extracted

ls -al /staging/*

echo "Data download & extraction complete"
