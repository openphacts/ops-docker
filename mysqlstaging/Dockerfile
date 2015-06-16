FROM mysql

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget

ADD download.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/download.sh

RUN mkdir /download
WORKDIR /download
RUN mkdir /staging
RUN /tmp/download.sh && mv /download/*.sql.gz /staging/ims.sql.gz
VOLUME /staging
ADD staging.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/staging.sh

CMD ["/usr/local/bin/staging.sh"]

