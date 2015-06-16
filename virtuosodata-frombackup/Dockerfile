FROM stain/virtuoso

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget

COPY download.sh load.sh /tmp/

RUN mkdir /download
VOLUME /download

# The below must be run on a single command to ensure the volumes
# are not wiped out
RUN /tmp/download.sh && /tmp/load.sh

