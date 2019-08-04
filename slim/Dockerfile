FROM golang:1.12-alpine3.10

RUN apk --no-cache add git
ADD plugins.go go.mod go.sum ./src/

# see https://github.com/golang/go/wiki/Modules#daily-workflow
RUN cd ./src \
  && GO111MODULE=on go build \
  && ./caddy -version | head -n1 \
  && ./caddy -plugins

# ---

FROM alpine:3.10

COPY --from=0 /go/src/caddy /usr/local/bin/
COPY ./Caddyfile /etc/caddy/
ENV CADDYPATH /var/lib/caddy

RUN adduser -D -u 1000 caddy
USER caddy

EXPOSE 8080 8443
CMD ["caddy", "-conf", "/etc/caddy/Caddyfile"]
