FROM golang:1.9-alpine3.7

RUN apk --no-cache add git \
  && go get github.com/mholt/caddy \
    && cd src/github.com/mholt/caddy; git checkout v0.10.10 \
  && go get github.com/caddyserver/builds

RUN sed -i '/\/\/ This is where other plugins get plugged in (imported)/a \
\\t_ "github.com/abiosoft/caddy-git"\n \
\t_ "github.com/caddyserver/forwardproxy"\n \
\t_ "github.com/BTBurke/caddy-jwt"\n \
\t_ "github.com/hacdias/filemanager"\n \
\t_ "github.com/casbin/caddy-authz"\n \
\t_ "github.com/tarent/loginsrv/caddy"\n \
\t_ "github.com/xuqingfeng/caddy-rate-limit"\n \
\t_ "github.com/hacdias/filemanager"\n \
\t_ "github.com/restic/caddy"\n \
\t_ "github.com/nicolasazrak/caddy-cache"\n \
\t_ "github.com/miekg/caddy-prometheus"\n' \
    /go/src/github.com/mholt/caddy/caddy/caddymain/run.go

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
