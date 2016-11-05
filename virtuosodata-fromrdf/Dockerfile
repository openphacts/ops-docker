FROM stain/virtuoso

COPY load.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/load.sh

COPY staging.sql /staging/

RUN /usr/local/bin/load.sh

