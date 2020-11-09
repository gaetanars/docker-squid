[![CircleCi](https://circleci.com/gh/gaetanars/docker-squid.svg?style=shield)](https://circleci.com/gh/gaetanars/docker-squid)

# Quickstart
```bash
docker run --name squid -d --restart=always \
  -p 3128:3128 \
  -v /srv/squid/cache:/var/spool/squid \
  zenman94/squid
```

# Config
You can mount your personnal `squid.conf` in `/etc/squid/squid.conf`
```bash
docker run --name squid -d --restart=always \
  -p 3128:3128 \
  -v /srv/squid/cache:/var/spool/squid \
  -v /srv/squid.conf:/etc/squid/squid.conf \
  zenman94/squid
```

## Logging
Please note that `access.log`  is redirected to `/dev/stdout`and `cache.log` is redirected to `/dev/stderr`.

You can also disable some logging in your `squid.conf` :
```bash
cache_log none
```
## User
Please do not modify `cache_effective_user` or `cache_effective_group`.