#!/bin/sh

sql=/tmp/staging-$$.sql
rm -f $sql

cd /staging
for file in *.sql.gz ; do
  db=`echo $file | sed 's/\\.gz$//' | sed 's/\\.sql//'`
  staged=.$db.staged
  if ! [ -f $staged ] ; then
    echo "CREATE DATABASE IF NOT EXISTS $db;" >> $sql
    echo "USE $db;" >> $sql
    gunzip $file >> $sql
    touch $staged
  fi
done  

mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" < $sql
