FROM stain/virtuoso

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget axel

COPY download.sh load.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/*sh

RUN mkdir /download
VOLUME /download

# Where to download Virtuoso backup dump from?
ENV BASE https://data.openphacts.org/free/2.0/virtuoso/


CMD /usr/local/bin/load.sh


