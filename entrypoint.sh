#!/bin/bash
set -e


mkdir -p ${SQUID_LOG_DIR}
chmod -R 755 ${SQUID_LOG_DIR}
chown -R ${SQUID_USER}:${SQUID_USER} ${SQUID_LOG_DIR}
chown --dereference ${SQUID_USER} "/proc/$$/fd/1" "/proc/$$/fd/2" || :
ln -sf /dev/stdout ${SQUID_LOG_DIR}/access.log

mkdir -p ${SQUID_CACHE_DIR}
chown -R ${SQUID_USER}:${SQUID_USER} ${SQUID_CACHE_DIR}

if [[ ! -d ${SQUID_CACHE_DIR}/00 ]]; then
  echo "Initializing cache..."
  $(which squid) -N -f /etc/squid/squid.conf -z
fi

exec "$@"