FROM stain/virtuoso

COPY load.sh /usr/local/bin/

# CMD ["/usr/local/bin/load.sh"]
CMD ["/usr/local/bin/staging.sh"]

# CMD isql 1111 dba dba /staging/triple-count.rq
