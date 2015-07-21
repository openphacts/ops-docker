FROM ubuntu:14.04

# Where to download from
ENV BASE http://data.openphacts.org/dev/1.5/rdf/

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget axel

RUN mkdir /download
WORKDIR /download
COPY download.sh staging.sql /download/

RUN /download/download.sh

RUN mkdir -p /staging
COPY staging.sql /staging/


WORKDIR /
CMD ["/bin/true"]

# Expose for linking - we'll do this last as it adds a burden
# to every build step
VOLUME /staging 
