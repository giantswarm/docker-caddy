# Dockerfile for Caddy

```
docker run \
  --volume $PWD/Caddyfile:/etc/caddy/Caddyfile \
  --volume $PWD/certs:/var/lib/caddy \
  --volume $PWD/html:/var/www \
  --publish 8080:8080 \
  --publish 8443:8443 \
  giantswarm/caddy:1.0.1
```
