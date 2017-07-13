#!/bin/bash

## Datasets with a "insert_queries.sparql" file.

declare -a datasets=(
    "enzyme"
    "chembl"
    "bao"
    "go"
    "disgenet"
    "chebi"
)

## A function that given a file containing a SPARQL query uses Virtuoso's 'isql' command to execute
## the query in the file. For a SPARQL query to execute properly

function run_insert_query() {
    local insert_query_file="$1"

    echo "execute SPARQL INSERT query in file: ${insert_query_file}"

    (echo "SPARQL"; cat "${insert_query_file}"; echo ";") | isql 1111 dba dba
}

for dataset in "${datasets[@]}"
do
    run_insert_query "/staging/${dataset}/data/insert_queries.sparql"
done

## Need to run 'rdf_loader_run();' ??
#isql 1111 dba dba exec="rdf_loader_run();"
# No (--Stian)
