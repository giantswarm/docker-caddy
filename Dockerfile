FROM golang:1.10-alpine3.7

RUN apk --no-cache add git \
  && go get github.com/mholt/caddy \
  && go get github.com/caddyserver/builds \
  && cd src/github.com/mholt/caddy \
  && git -c advice.detachedHead=false checkout v0.10.11 \
  && cd caddy \
  && sed -i '/\/\/ This is where other plugins get plugged in (imported)/a \
\\t_ "github.com/casbin/caddy-authz" // http.authz\n \
\t_ "github.com/nicolasazrak/caddy-cache" // http.cache\n \
\t_ "github.com/jung-kurt/caddy-cgi" // http.cgi\n \
\t_ "github.com/captncraig/cors" // http.cors\n \
\t_ "github.com/epicagency/caddy-expires" // http.expires\n \
\t_ "github.com/echocat/caddy-filter" // http.filter\n \
\t_ "github.com/caddyserver/forwardproxy" // http.forwardproxy\n \
\t_ "github.com/abiosoft/caddy-git" // http.git\n \
\t_ "github.com/pyed/ipfilter" // http.ipfilter\n \
\t_ "github.com/BTBurke/caddy-jwt" // http.jwt\n \
\t_ "github.com/simia-tech/caddy-locale" // http.locale\n \
\t_ "github.com/tarent/loginsrv/caddy" // http.login\n \
\t_ "github.com/hacdias/caddy-minify" // http.minify\n \
\t_ "github.com/Xumeiquer/nobots" // http.nobots\n \
\t_ "github.com/miekg/caddy-prometheus" // http.prometheus\n \
\t_ "github.com/mastercactapus/caddy-proxyprotocol" // http.proxyprotocol\n \
\t_ "github.com/xuqingfeng/caddy-rate-limit" // http.ratelimit\n \
\t_ "github.com/captncraig/caddy-realip" // http.realip\n \
\t_ "github.com/freman/caddy-reauth" // http.reauth\n \
\t_ "github.com/restic/caddy" // http.restic\n \
\t_ "github.com/hacdias/caddy-webdav" // http.webdav\n' \
    caddymain/run.go \
  && go get \
  && go run build.go \
  && ./caddy -version | head -n1 \
  && ./caddy -plugins

# \t_ "github.com/wmark/caddy.upload" // http.upload\n \
# error: package github.com/wmark/caddy.upload: code in directory /go/src/github.com/wmark/caddy.upload expects import "blitznote.com/src/caddy.upload"

# \t_ "github.com/pieterlouw/caddy-grpc" // http.grpc\n \
# error: ../../../pieterlouw/caddy-grpc/server.go:45:54: cannot use director (type func("context".Context, string) (*grpc.ClientConn, error)) as type proxy.StreamDirector in argument to proxy.TransparentHandler

# \t_ "github.com/filebrowser/filebrowser/tree/master/caddy/filemanager" // http.filemanager\n \
# package github.com/filebrowser/filebrowser/tree/master/caddy/filemanager: cannot find package "github.com/filebrowser/filebrowser/tree/master/caddy/filemanager" in any of:

# ---

FROM alpine:3.7

COPY --from=0 /go/src/github.com/mholt/caddy/caddy /usr/local/bin/
COPY ./Caddyfile /etc/caddy/
ENV CADDYPATH /var/lib/caddy

EXPOSE 80 443
CMD ["caddy", "-conf", "/etc/caddy/Caddyfile"]
