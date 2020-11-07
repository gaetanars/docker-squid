## Quickstart
```bash
docker run --name squid -d --restart=always \
  --publish 3128:3128 \
  --volume /srv/squid/cache:/var/spool/squid \
  zenman94/squid
```