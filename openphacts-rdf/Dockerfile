FROM ubuntu:16.04

ENV OPS_VERSION 2.1

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget aria2

## ENV vars are for downloading RDF data from Artifactory repository in https://data.openphacts.org.
## The data is divided between 'free' and 'nonfree' data.  The nonfree requires a password.
## Downloading is done in the script "download.sh".
#
## free data
ENV URL_DATA_FREE https://data.openphacts.org/free/${OPS_VERSION}/rdf/
## non-free data
ENV URL_DATA_NONFREE https://data.openphacts.org/non-free/${OPS_VERSION}/rdf/
ENV USER_NONFREE randy
ENV PASSWORD_NONFREE AP9fXcg93HTXrZGWNfP5A2HWGNz

RUN mkdir -p /download
WORKDIR /download
COPY download.sh /usr/local/bin/

# RUN chmod 755 /usr/local/bin/download.sh
# RUN /usr/local/bin/download.sh

RUN mkdir -p /staging
# COPY staging.sql /staging/
COPY triple-count.rq /staging/

RUN ["/usr/local/bin/download.sh"]

VOLUME /download/
VOLUME /staging/

# CMD ls -al /staging/

