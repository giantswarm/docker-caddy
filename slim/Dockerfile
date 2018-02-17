FROM golang:1.9-alpine3.7

RUN apk --no-cache add git \
  && go get github.com/mholt/caddy \
    && cd src/github.com/mholt/caddy; git checkout v0.10.10 \
  && go get github.com/caddyserver/builds

RUN cd /go/src/github.com/mholt/caddy/caddy \
  && go get \
  && go run build.go \
  && ./caddy -version | head -n1 \
  && ./caddy -plugins


FROM alpine:3.7

COPY --from=0 /go/src/github.com/mholt/caddy/caddy /usr/local/bin/

COPY ./Caddyfile /etc/caddy/
ENV CADDYPATH /var/lib/caddy

EXPOSE 80 443
CMD ["caddy", "-conf", "/etc/caddy/Caddyfile"]
