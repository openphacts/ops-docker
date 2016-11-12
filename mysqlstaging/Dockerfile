FROM mysql:5.7

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget axel cpipe

COPY download.sh /usr/local/bin/

RUN mkdir /download
WORKDIR /download
RUN mkdir /staging
RUN /usr/local/bin/download.sh && mv /download/*.sql.gz /staging/ims.sql.gz
VOLUME /staging

COPY staging.sh /usr/local/bin/

CMD ["/usr/local/bin/staging.sh"]

