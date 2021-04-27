FROM ubuntu:latest
LABEL maintainer="jucarlos.silva@gmail.com"

ENV SQUID_VERSION=4.10 \
    SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y squid apache2-utils \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh
COPY squid /etc/squid
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 3128/tcp
ENTRYPOINT ["/sbin/entrypoint.sh"]
