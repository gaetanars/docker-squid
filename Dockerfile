FROM ubuntu:rolling

ARG SQUID_VERSION=4.13-10ubuntu5
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        squid=${SQUID_VERSION} \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
COPY squid.conf /etc/squid/squid.conf
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3128/tcp

VOLUME ["/var/spool/squid"]

CMD ["squid", "-f", "/etc/squid/squid.conf","-NYC"]