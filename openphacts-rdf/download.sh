#!/bin/bash
set -e

## Inherited from Dockerfile, e.g.:
## URL_DATA_FREE=http://data.openphacts.org/free/2.1/rdf/
## URL_DATA_NONFREE=http://data.openphacts.org/non-free/2.1/rdf/

cd /download

wget -e robots=off --no-verbose --recursive --no-directories -A '*.*' --no-parent ${URL_DATA_FREE}
wget -e robots=off --no-verbose --recursive --no-directories -A '*.*' --no-parent \
     --user=${USER_NONFREE} --password=${PASSWORD_NONFREE} ${URL_DATA_NONFREE}

touch .downloaded

echo "Data download complete"
