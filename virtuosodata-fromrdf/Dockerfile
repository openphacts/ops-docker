FROM stain/virtuoso

COPY load.sh /usr/local/bin/

COPY staging.sql /staging/

RUN chmod 755 /usr/local/bin/load.sh

CMD ["/usr/local/bin/load.sh"]

