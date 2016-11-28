# Docker service: virtuosostagingrdf

Docker build folder.

This folder contains the build definition for building the Virtuoso
triple-store component of Open PHACTS.
 
RDF data files to load are downloaded from prepared datasets stored in
Artifactory at [http://data.openphacts.org/webapp](http://data.openphacts.org/webapp).

The file `list-of-graphs.txt` is a list of RDF graphs into which
triples are loaded during the building of the RDF store.  It is for
documentation and testing purposes, not used to build.

