#!/bin/bash

declare -a datasets=(
    "enzyme"
    "chembl"
    "bao"
    "go"
    "disgenet"
    "chebi"
)

function run_insert_query() {
    local insert_query_file="$1"

    echo "execute SPARQL INSERT query in file: ${insert_query_file}"

    (echo "SPARQL"; cat "${insert_query_file}"; echo ";") | isql 1111 dba dba
}

for dataset in "${datasets[@]}"
do
    run_insert_query "/staging/${dataset}/data/insert_queries.sparql"
done


isql 1111 dba dba exec="rdf_loader_run();"
