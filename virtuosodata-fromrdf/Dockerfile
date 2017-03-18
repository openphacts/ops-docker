FROM stain/virtuoso

## These settings for 62GB RAM system
#
RUN sed -i 's/\(NumberOfBuffers.*=\).*/\1 5400000/' /etc/virtuoso-opensource-7/virtuoso.ini
RUN sed -i 's/\(MaxDirtyBuffers.*=\).*/\1 4000000/' /etc/virtuoso-opensource-7/virtuoso.ini
RUN sed -i 's/\(MaxCheckpointRemap.*=\).*/\1 7500000/' /etc/virtuoso-opensource-7/virtuoso.ini

COPY load.sh /usr/local/bin/

# COPY staging.sql /staging/
COPY staging.sql /

RUN ["/usr/local/bin/load.sh"]

COPY inferences.sh /usr/local/bin/
COPY triple-count.rq /staging/

RUN ["/usr/local/bin/inferences.sh"]

#CMD ["/usr/local/bin/load.sh"]

# CMD isql 1111 dba dba /staging/triple-count.rq
