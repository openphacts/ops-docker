# FROM stain/virtuoso
FROM aeed2d3b95a9

COPY load.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/load.sh

COPY extract.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/extract.sh

RUN mkdir -p /staging

COPY staging.sql /staging/
COPY triple-count.rq /staging/

# VOLUME /staging

RUN /usr/local/bin/extract.sh

RUN /usr/local/bin/load.sh

CMD isql 1111 dba dba /staging/triple-count.rq
