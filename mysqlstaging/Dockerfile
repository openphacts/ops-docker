FROM mysql

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget

COPY download.sh /tmp/

RUN mkdir /download
WORKDIR /download
RUN mkdir /staging
RUN /tmp/download.sh && mv /download/*.sql.gz /staging/ims.sql.gz
VOLUME /staging
ADD staging.sh /usr/local/bin/
CMD ["staging.sh"]

