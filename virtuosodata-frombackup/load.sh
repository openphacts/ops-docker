#!/bin/sh
set -e
cd /virtuoso
if [ -f .loaded ] ; then
  exit
fi
if ! [ -f *#1.bp ] ; then
  /usr/local/bin/download.sh	
fi
DUMP=`echo *#1.bp | sed s/1.bp//`
echo Loading $DUMP -- `find -type f| wc -l` files

virtuoso-t +configfile /etc/virtuoso-opensource-7/virtuoso.ini  +restore-backup $DUMP
rm $DUMP*
touch .loaded
echo "Loading completed"
