#!/bin/sh
DUMP=`echo *#1.bp | sed s/1.bp//`
echo Loading $DUMP
virtuoso-t +configfile /etc/virtuoso-opensource-7/virtuoso.ini  +restore-backup $DUMP
rm $DUMP*
