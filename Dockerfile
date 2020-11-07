FROM ubuntu:groovy-20201022.1

ENV SQUID_VERSION=4.13 \
    PKG_RELEASE=1ubuntu2 \
    SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        squid=${SQUID_VERSION}-${PKG_RELEASE} \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
COPY squid.conf /etc/squid/squid.conf
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3128/tcp

STOPSIGNAL SIGTERM

CMD ["squid", "-f", "/etc/squid/squid.conf","-NYCd","1"]