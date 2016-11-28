#!/bin/sh

set -e

# wait for mysql at least 30 seconds
MYSQL_SLEEP=6
echo "Sleep for ${MYSQL_SLEEP} seconds..."
sleep $MYSQL_SLEEP &

# sql=/tmp/staging.sql
# rm -f $sql
# # empty file to start with
# touch sql

cd /staging

# # Forget about any incomplete staging
# rm -rf staging
# mkdir -p staging staged
# if ! [ -f $sql ] ; then
#   echo "mySQL already staged"
#   # exit 0
# fi


export MYSQL_ROOT_PASSWORD="uCie0ahgah"
export MYSQL_HOST="127.0.0.1"

# # To avoid password warnings..
# echo "[client]" > /tmp/my.conf
# # echo "host=$MYSQL_PORT_3306_TCP_ADDR" >> /tmp/my.conf
# # echo "host=127.0.0.1" >> /tmp/my.conf
# # echo "host=localhost" >> /tmp/my.conf
# echo "host=172.17.0.2" >> /tmp/my.conf
# echo "port=3306" >> /tmp/my.conf
# # echo "database=i<ms" >> /tmp/my.conf
# echo "protocol=tcp" >> /tmp/my.conf

# echo "user=root" >> /tmp/my.conf
# echo "password=uCie0ahgah" >> /tmp/my.conf

# echo "user=ims" >> /tmp/my.conf
# echo "password=ims" >> /tmp/my.conf

# echo " cat /tmp/my.conf"
# cat /tmp/my.conf

# hope that mysql has started
echo "Waiting for mySQL, up to $MYSQL_SLEEP seconds."
wait
echo "mySQL staging"
# ls -alh /tmp/staging.sql

echo "host=$MYSQL_PORT_3306_TCP_ADDR"

# cat $sql | cpipe -vw -b 8192 | mysql --defaults-file=/tmp/my.conf --protocol=TCP

echo "do myslqshow 2"

# echo `which mysql`

echo '/etc/hosts :'
cat /etc/hosts

echo 'env = '
echo `env`

# mysqlshow --defaults-file=/tmp/my.conf \

mysqlshow --protocol=tcp \
          --host=$HOSTNAME \
          --user=root \
          --password=uCie0ahgah

          # --host=397f80c505a4 \
          # --host=172.17.0.2 \

echo "load data"
echo "ls -l /test"

# cat /test/ims2.sql | mysql --defaults-file=/tmp/my.conf \
#                            --protocol=tcp \
#                            --user=ims \
#                            --password=ims \
#                            --host=172.17.0.2

# echo "do myslqshow ims"
# mysqlshow --defaults-file=/tmp/my.conf \
#           --protocol=tcp \
#           --user=root \
#           --password=uCie0ahgah \
#           --host=172.17.0.2 \
#           ims

          # --user=ims \
          # --password=ims \

echo "after mysqlshow"

# Mark as staged
# mv staging/* staged/
# rm -f $sql
echo "mySQL staging finished"
