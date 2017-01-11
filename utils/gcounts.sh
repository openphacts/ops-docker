#!/bin/bash

### A script to compare the counts of triples, by graph, for two Virtuoso SPARQL endpoints that
### should contain the same data.

baseUrl='https://beta.openphacts.org'
newUrl='http://livingstone.data2discovery.net:3003'

## Functions to perform URL encoding and decoding of URLs passed to HTTP web services.

urlencode() {
    # urlencode <string>
    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C

    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done

    LC_COLLATE=$old_lc_collate
}

urldecode() {
    # urldecode <string>

    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\\x}"
}

declare -a GRAPH_URIS=(
    http://aers.data2semantics.org/
    http://ops.rsc.org
    http://purl.uniprot.org
    http://purl.uniprot.org/enzyme
    http://purl.uniprot.org/enzyme/direct
    http://purl.uniprot.org/enzyme/inference
    http://rdf.imim.es
    http://rdf.ncats.nih.gov/opddr
    http://rdf.ncats.nih.gov/opddr/pubchem
    http://www.bioassayontology.org
    http://www.conceptwiki.org
    http://www.ebi.ac.uk/chebi
    http://www.ebi.ac.uk/chebi/direct
    http://www.ebi.ac.uk/chebi/inference
    http://www.ebi.ac.uk/chembl
    http://www.ebi.ac.uk/chembl/target/direct
    http://www.ebi.ac.uk/chembl/target/inference
    http://www.ebi.ac.uk/surechembl
    http://www.geneontology.org
    http://www.geneontology.org/inference
    http://www.nextprot.org
    http://www.nextprot.org/caloha
    http://www.openphacts.org/api/datasetDescriptors
    http://www.openphacts.org/bio2rdf/drugbank
    http://www.openphacts.org/goa
    http://www.wikipathways.org
)

# GRAPH_URI="http://www.openphacts.org/bio2rdf/drugbank"
# GRAPH_URI_ENC=`urlencode $GRAPH_URI`

echo $(date -u)

## For each RDF Graph in the list above, print out the Graph URI followed by the triple counts
## in the 'base' and 'new' SPARQL endpoints.

for GRAPH_URI in "${GRAPH_URIS[@]}"; do
    GRAPH_URI_ENC=`urlencode $GRAPH_URI`
    COMMAND='/sparql?default-graph-uri=&query=SELECT+%28count%28*%29+as+%3FgCount%29+WHERE+%7BGRAPH+%3C'${GRAPH_URI_ENC}'%3E+%7B+%3Fs+%3Fp+%3Fo+%7D%7D&format=text%2Ftab-separated-values&timeout=0&debug=on'
    echo '==== Graph:' ${GRAPH_URI}
    curl ${baseUrl}${COMMAND} | tail -1
    curl ${newUrl}${COMMAND} | tail -1
done

echo "DONE"
