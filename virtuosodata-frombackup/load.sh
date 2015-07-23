#!/bin/sh
set -e
cd /virtuoso
if [ -f .loaded ] ; then
  exit
fi
if ! [ -f *_1.bp ] ; then
  /usr/local/bin/download.sh	
fi
# FIXME: Check for _1.bp vs _#1.bp
DUMP=`echo *_1.bp | sed s/1.bp//`
echo Loading $DUMP -- `find -type f| wc -l` files

virtuoso-t +configfile /etc/virtuoso-opensource-7/virtuoso.ini  +restore-backup $DUMP
rm $DUMP*
touch .loaded
echo "Loading completed"
