FROM ubuntu:16.04

ENV OPS_VERSION 2.1

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget aria2

COPY download.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/download.sh
## Where to download from
##
## free
ENV URL_DATA_FREE https://data.openphacts.org/free/${OPS_VERSION}/rdf/
## non-free
ENV URL_DATA_NONFREE https://data.openphacts.org/non-free/${OPS_VERSION}/rdf/
ENV USER_NONFREE randy
ENV PASSWORD_NONFREE AP9fXcg93HTXrZGWNfP5A2HWGNz

RUN mkdir -p /download

WORKDIR /download

RUN /usr/local/bin/download.sh

VOLUME /download

CMD ls -al /download

