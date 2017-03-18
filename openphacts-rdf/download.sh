#!/bin/bash
set -e

## Inherited from Dockerfile, e.g.:
#OPS_VERSION="2.1"
#URL_DATA_FREE=https://data.openphacts.org/free/${OPS_VERSION}/rdf/
#URL_DATA_NONFREE=https://data.openphacts.org/non-free/${OPS_VERSION}/rdf/
#USER_NONFREE=randy
#PASSWORD_NONFREE=AP9fXcg93HTXrZGWNfP5A2HWGNz

cd /download

## Try to download in 4 parallel streams:
## 1. uniprot
## 2. go & goa
## 3. surechembl (the largest) & drugbank
## 4. all the rest

#wget -e robots=off --no-verbose --recursive --no-directories --no-parent -A 'uniprot.*' \
#    ${URL_DATA_FREE} &
#wget -e robots=off --no-verbose --recursive --no-directories --no-parent -A 'go*' \
#    ${URL_DATA_FREE} &
#wget -e robots=off --no-verbose --recursive --no-directories --no-parent -A '[a-f|h-t|v-z]*.*' \
#    ${URL_DATA_FREE} &
#
#wget -e robots=off --no-verbose --recursive --no-directories -A '*.*' --no-parent \
#     --user=${USER_NONFREE} --password=${PASSWORD_NONFREE} ${URL_DATA_NONFREE}

#    (echo "SPARQL"; cat "${insert_query_file}"; echo ";") | isql 1111 dba dba

#cd /download

if [ -f .downloaded ] ; then
  echo "Already downloaded, nothing more to do."
  echo "To force new download, delete /download/.downloaded"
  exit 0
fi

declare -a free_datasets=(
    "aers"
    "bao"
    "caloha"
    "chebi"
    "chembl"
    "conceptwiki"
    "disgenet"
    "doid"
    "enzyme"
    "goa"
    "go"
    "ncats"
    "nextprot"
    "ocrs"
    "uniprot"
    "void"
    "wikipathways"
)

declare -a nonfree_datasets=(
    "drugbank"
    "surechembl"
)

function is_free_dataset() {
    local dataset="$1"

    if [ $dataset == "drugbank" ] || [ $dataset == "surechembl" ]; then
        echo "false"
    else
        echo "true"
    fi
}

function get_baseurl() {
    local dataset="$1"

    if [ $dataset == "drugbank" ] || [ $dataset == "surechembl" ]; then
        echo "$URL_DATA_NONFREE"
    else
        echo "$URL_DATA_FREE"
    fi
}

function get_datafile_url() {
    local dataset="$1"

    if [ $dataset == "drugbank" ] || [ $dataset == "surechembl" ]; then
        echo "${URL_DATA_NONFREE}${dataset}.tar"
    else
        echo "${URL_DATA_FREE}${dataset}.tar"
    fi
}

function update_sha_file() {
    local dataset="$1"

    if [ $(is_free_dataset ${dataset}) == "true" ] ; then
        local shafile=${dataset}.tar.sha1
        local datafile=${dataset}.tar
        local checksum=`cat ${shafile}`
        # Rewrite in sha1sum-format
        echo "${checksum}  ${datafile}" > ${shafile}
#        cat ${shafile}
    fi
}

function get_sha() {
    local dataset="$1"

    local shafile=${dataset}.tar.sha1
    local readmefile=${dataset}-README.txt
    local baseurl=$(get_baseurl $dataset)

    if ! [ -f ${shafile} ]; then
        local baseurl=$(get_baseurl ${dataset})
        wget -e robots=off --no-verbose --no-directories --no-parent $baseurl${shafile}
        wget -e robots=off --no-verbose --no-directories --no-parent $baseurl${readmefile}
        update_sha_file ${dataset}
    fi
}

function add_to_download_list() {
    local dataset="$1"

    local datafile=${dataset}.tar
    local shafile=${dataset}.tar.sha1
    local is_free=`is_free_dataset ${dataset}`

    if ! [ -f ${datafile} ] || [ $is_free == "true" ] && ! sha1sum --status -c ${shafile} 2>/dev/null ;
      then
        # Missing or wrong checksum, start again
        rm -f ${datafile}
        local baseurl=$(get_baseurl ${dataset})
        url="${baseurl}${datafile}"
        echo $url >> /tmp/urls
    fi
}

rm -f /tmp/urls

for dataset in "${nonfree_datasets[@]}"
do
    add_to_download_list ${dataset}
done

for dataset in "${free_datasets[@]}"
do
    get_sha ${dataset}
    add_to_download_list ${dataset}
done


if [ -f /tmp/urls ] ; then
  echo "Downloading RDF datasets to /download"
  cat /tmp/urls
  echo
  aria2c -x8 --http-user=${USER_NONFREE} --http-passwd=${PASSWORD_NONFREE} -i /tmp/urls
fi

echo "Verifying checksums"
sha1sum -c *sha1

touch .downloaded

echo "Data download complete"
