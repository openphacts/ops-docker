FROM stain/virtuoso

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget

COPY download.sh load.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/*sh

RUN mkdir /download
VOLUME /download

# Where to download Virtuoso backup dump from?
#ENV BASE http://data.openphacts.org/1.5/virtuoso/
ENV BASE http://data.openphacts.org/dev/1.5/virtuoso/


CMD /usr/local/bin/load.sh


