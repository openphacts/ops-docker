FROM ubuntu:16.04

# Where to download from
ENV BASE https://data.openphacts.org/free/2.0/rdf/
# Non-commercial users might instead use
#ENV BASE https://data.openphacts.org/non-free/2.0/rdf/

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget aria2

RUN mkdir /download
WORKDIR /download
COPY download.sh /usr/local/bin/

VOLUME /download
# Expose for linking
VOLUME /staging 

#RUN /download/download.sh

RUN mkdir -p /staging
COPY staging.sql /staging/

CMD ["/usr/local/bin/download.sh"]

