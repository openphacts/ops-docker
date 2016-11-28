FROM mysql:5.7

# RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget axel cpipe

ADD test.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/*.sh

RUN mkdir /staging
VOLUME /staging

# CMD ["/usr/local/bin/test.sh"]

RUN /usr/local/bin/test.sh

CMD ["bash"]
