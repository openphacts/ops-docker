FROM stain/virtuoso

# Where to download from
ENV BASE https://data.openphacts.org/free/2.1/rdf/
# Non-commercial users might instead use
#ENV BASE https://data.openphacts.org/non-free/2.0/rdf/

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget aria2

COPY download.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/download.sh

RUN mkdir -p /download

WORKDIR /download

RUN /usr/local/bin/download.sh

VOLUME /download

CMD ls -al /download

