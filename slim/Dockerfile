FROM alpine:3.5

RUN apk --no-cache add curl ca-certificates \
  && arch=$(apk --print-arch | sed 's/x86_64/amd64/') \
  && curl -sfSL "https://caddyserver.com/download/build?os=linux&arch=$arch" \
    | tar -xz -C /tmp \
  && mv /tmp/caddy /usr/bin/caddy \
  && mkdir /var/www
  # FIXME! checksum

COPY ./Caddyfile /etc/caddy/
ENV CADDYPATH /var/lib/caddy

VOLUME /etc/caddy
VOLUME /var/lib/caddy
VOLUME /var/www

EXPOSE 80 443
CMD ["caddy", "-conf", "/etc/caddy/Caddyfile"]
