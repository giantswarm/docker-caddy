FROM alpine:3.6

ARG plugins=http.authz,http.awslambda,http.cgi,http.cors,http.datadog,http.expires,http.filemanager,http.filter,http.git,http.gopkg,http.grpc,http.hugo,http.ipfilter,http.jwt,http.login,http.mailout,http.minify,http.nobots,http.prometheus,http.proxyprotocol,http.ratelimit,http.realip,http.reauth,http.restic,http.upload,http.webdav,tls.dns.cloudflare,tls.dns.digitalocean,tls.dns.dnsimple,tls.dns.dnspod,tls.dns.dyn,tls.dns.exoscale,tls.dns.gandi,tls.dns.googlecloud,tls.dns.linode,tls.dns.namecheap,tls.dns.ovh,tls.dns.rackspace,tls.dns.rfc2136,tls.dns.route53,tls.dns.vultr

RUN apk --no-cache add curl ca-certificates git \
  && arch=$(apk --print-arch | sed 's/x86_64/amd64/') \
  && curl -sfSL "https://caddyserver.com/download/linux/$arch?plugins=$plugins" \
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
