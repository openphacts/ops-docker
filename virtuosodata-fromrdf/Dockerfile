FROM stain/virtuoso

COPY load.sh /usr/local/bin/

# COPY staging.sql /staging/
COPY staging.sql /

RUN ["/usr/local/bin/load.sh"]

COPY inferences.sh /usr/local/bin/
COPY triple-count.rq /staging/

RUN ["/usr/local/bin/inferences.sh"]

#CMD ["/usr/local/bin/load.sh"]

# CMD isql 1111 dba dba /staging/triple-count.rq
