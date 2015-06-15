FROM stain/virtuoso

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget

COPY download.sh /tmp/

RUN mkdir /download
VOLUME /download

# The below must be run on a single command to ensure the volumes
# are not wiped out
RUN /tmp/download.sh && \
  DUMP=$(echo /staging/*/*#1.bp | sed s/1.bp//) && \
  echo Loading $DUMP && \
  virtuoso-t +configfile /etc/virtuoso-opensource-7/virtuoso.ini  +restore-backup /staging/*

