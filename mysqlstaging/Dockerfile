FROM mysql

ENV URL http://data.openphacts.org/1.5/ims/ims-1.5-20150519.sql.gz

ADD staging.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/*.sh

RUN mkdir /staging
ADD $URL.sha1 /staging/ims.sql.gz.sha1
ADD $URL /staging/ims.sql.gz
RUN sha1sum -c /staging/ims.sql.gz.sha1

CMD ["/usr/local/bin/staging.sh"]

