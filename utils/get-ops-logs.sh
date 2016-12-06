#!/bin/bash

### A script to copy log files out of running docker images into a new folder of log files.
### The new folder will be a subfolder of ops-docker/logs and be named with the timestamp
### of when this script was run. Does not alter the log files in the docker containers.

## SCRIPTPATH is full path to directory containing this script (.../ops-docker/utils/)
## LOGSBASE is full path to directory containing logs (.../ops-docker/logs/)
#
SCRIPTPATH="$( cd "$(dirname "$BASH_SOURCE[0]")" ; pwd )"
LOGSBASE="$(dirname "$SCRIPTPATH")"/logs

[ -d "$LOGSBASE" ] || exit 99

## Get current UTC time, to the minute, e.g., '2016-12-04T22:57'
#
LOGS_WHEN=$(date --utc --iso-8601=minutes |sed 's/+.*//')

## Folder to which new logs files will be copied.
#
LOGS_DIR="${LOGSBASE}/${LOGS_WHEN}"

echo "Copying docker logs to: $LOGS_DIR"

mkdir -p ${LOGS_DIR}

#mkdir -p ${LOGS_DIR}/api
docker cp ops-api:/var/www/html/logs ${LOGS_DIR}/api

#mkdir -p ${LOGS_DIR}/ims
docker cp ops-ims:/usr/local/tomcat/logs ${LOGS_DIR}/ims

mkdir -p ${LOGS_DIR}/virtuoso
docker cp ops-virtuoso:/virtuoso/virtuoso.log ${LOGS_DIR}/virtuoso/

mkdir -p ${LOGS_DIR}/mysql
docker cp ops-mysql:/var/lib/mysql/ib_logfile0 ${LOGS_DIR}/mysql/
docker cp ops-mysql:/var/lib/mysql/ib_logfile1 ${LOGS_DIR}/mysql/
