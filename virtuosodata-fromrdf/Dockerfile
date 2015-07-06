FROM stain/virtuoso

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget axel

COPY download.sh staging.sql /tmp/

RUN mkdir /download
VOLUME /download
WORKDIR /download

# Load using staging.sql from stain/virtuoso
# The below must be run on a single command to ensure the volumes
# are not wiped out
RUN mkdir /virtuoso-staging
RUN /tmp/download.sh && \
	cp /tmp/staging.sql /staging/ && \
	/usr/local/bin/staging.sh && \
	sleep 5 && \
	echo "Archiving /virtuoso" && \
	tar cfv /virtuoso.tar /virtuoso && \
	echo "Done"
# Move it back at runtime to the fresh /virtuoso volume
# WARNING: This requires ***loads of extra disk space
WORKDIR /
CMD ["tar", "xfv", "/virtuoso.tar"]

