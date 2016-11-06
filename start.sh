#!/bin/bash

# DC_HOME=$(pwd)
DC_HOME=/media/tyree/ops/prj/ops-docker

cd ${DC_HOME}/openphacts-rdf

OPSRDF_CID=$( docker create \
                     --name ops-rdf \
                     -v /media/tyree/ops/rdf/download/:/download/ \
    )

cd ${DC_HOME}/virtuosodata-fromrdf

OPSSTG_CID=$( docker create \
                     --name ops-virt-staging \
                     --volumes-from ${OPSRDF_CID} \
                     -v /media/tyree/ops/rdf/staging/:/staging/ \
                     )
