FROM golang:1.10-alpine3.7

RUN apk --no-cache add git \
  && go get github.com/mholt/caddy \
  && go get github.com/caddyserver/builds \
  && cd src/github.com/mholt/caddy \
  && git -c advice.detachedHead=false checkout v0.10.13 \
  && cd caddy \
  && go get \
  && go run build.go \
  && ./caddy -version | head -n1 \
  && ./caddy -plugins

# ---

FROM gcr.io/distroless/base@sha256:3bbeac2989faa8ff33f5e34ea005f8a91c8442284fda342c572b61114d0dc847

COPY --from=0 /go/src/github.com/mholt/caddy/caddy /
COPY ./Caddyfile /etc/caddy/
ENV CADDYPATH /var/lib/caddy

EXPOSE 80 443
CMD ["/caddy", "-conf", "/etc/caddy/Caddyfile"]
