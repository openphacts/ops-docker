FROM ubuntu:14.04

# Where to download from
ENV BASE http://data.openphacts.org/dev/1.5/rdf/

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget axel

RUN mkdir /download
WORKDIR /download
# Get *.sha1 first
RUN wget -e robots=off --no-verbose --recursive --no-directories -A "*.tar*sha1" --no-parent $BASE
COPY download.sh /usr/local/bin/

VOLUME /download
# Expose for linking
VOLUME /staging 

#RUN /download/download.sh

RUN mkdir -p /staging
COPY staging.sql /staging/

CMD ["/usr/local/bin/download.sh"]

