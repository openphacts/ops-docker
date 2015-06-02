FROM stain/virtuoso

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget

COPY download.sh staging.sql /tmp/

RUN mkdir /download
VOLUME /download
WORKDIR /download

# Load using staging.sql from stain/virtuoso
RUN /tmp/download.sh && cp /tmp/staging.sql /staging/ && /usr/local/bin/start-virtuoso.sh



