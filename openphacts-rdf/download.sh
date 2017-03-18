#!/bin/bash
set -e

## Inherited from Dockerfile, e.g.:
## URL_DATA_FREE=http://data.openphacts.org/free/2.1/rdf/
## URL_DATA_NONFREE=http://data.openphacts.org/non-free/2.1/rdf/

cd /download

## Try to download in 4 parallel streams:
## 1. uniprot
## 2. go & goa
## 3. surechembl (the largest) & drugbank
## 4. all the rest

wget -e robots=off --no-verbose --recursive --no-directories --no-parent -A 'uniprot.*' \
    ${URL_DATA_FREE} &
wget -e robots=off --no-verbose --recursive --no-directories --no-parent -A 'go*' \
    ${URL_DATA_FREE} &
wget -e robots=off --no-verbose --recursive --no-directories --no-parent -A '[a-f|h-t|v-z]*.*' \
    ${URL_DATA_FREE} &

wget -e robots=off --no-verbose --recursive --no-directories -A '*.*' --no-parent \
     --user=${USER_NONFREE} --password=${PASSWORD_NONFREE} ${URL_DATA_NONFREE}

touch .downloaded

echo "Data download complete"
