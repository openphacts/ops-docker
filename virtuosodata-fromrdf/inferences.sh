#!/bin/bash

isql 1111 dba dba /staging/enzyme/data/insert_queries.sparql
isql 1111 dba dba /staging/chembl/data/insert_queries.sparql
isql 1111 dba dba /staging/bao/data/insert_queries.sparql
isql 1111 dba dba /staging/go/data/insert_queries.sparql
isql 1111 dba dba /staging/disgenet/data/insert_queries.sparql
isql 1111 dba dba /staging/chebi/data/insert_queries.sparql

isql 1111 dba dba exec="rdf_loader_run();"
