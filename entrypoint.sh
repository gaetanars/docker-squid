#!/bin/bash
set -e


mkdir -p /var/log/squid
chmod -R 755 /var/log/squid
chown -R proxy:proxy /var/log/squid
chown --dereference proxy "/proc/$$/fd/1" "/proc/$$/fd/2" || :
ln -sf /dev/stdout /var/log/squid/access.log
ln -sf /dev/stderr /var/log/squid/cache.log

mkdir -p /var/spool/squid
chown -R proxy:proxy /var/spool/squid

if [[ ! -d /var/spool/squid/00 ]]; then
  echo "Initializing cache..."
  $(which squid) -N -f /etc/squid/squid.conf -z
fi

exec "$@"