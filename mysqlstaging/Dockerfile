FROM mysql

ENV URL http://data.openphacts.org/1.5/ims/ims-1.5-20150519.sql.gz

ADD staging.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/*.sh

RUN mkdir /staging
ADD $URL.sha1 $URL /staging/
RUN sha1sum -c /staging/*.sha1
RUN mv /staging/*sql.gz /staging/ims.sql.gz

CMD ["/usr/local/bin/staging.sh"]

