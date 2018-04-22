FROM golang:1.10-alpine3.7

RUN apk --no-cache add git \
  && go get github.com/mholt/caddy \
  && go get github.com/caddyserver/builds \
  && cd src/github.com/mholt/caddy \
  && git -c advice.detachedHead=false checkout v0.10.14 \
  && cd caddy \
  && go get \
  && go run build.go \
  && ./caddy -version | head -n1 \
  && ./caddy -plugins

# ---

FROM alpine:3.7

COPY --from=0 /go/src/github.com/mholt/caddy/caddy /usr/local/bin/
COPY ./Caddyfile /etc/caddy/
ENV CADDYPATH /var/lib/caddy

EXPOSE 80 443
CMD ["caddy", "-conf", "/etc/caddy/Caddyfile"]
