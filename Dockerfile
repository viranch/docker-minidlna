FROM debian:wheezy

RUN apt-get update; \
    apt-get install -y --no-install-recommends minidlna; \
    rm -rf /var/lib/apt/lists/*

ADD minidlna.conf /etc/minidlna.conf

ADD start.sh /opt/

VOLUME /media

CMD ["/opt/start.sh"]
