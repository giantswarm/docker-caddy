package main

import (
	"github.com/caddyserver/caddy/caddy/caddymain"
	
	// plug in plugins here, for example:
	// _ "import/path/here"
	_ "github.com/linkonoid/caddy-dyndns" // dyndns
	_ "github.com/casbin/caddy-authz" // http.authz
	// _ "github.com/miquella/caddy-awses" // http.awses // fails to build
	_ "github.com/coopernurse/caddy-awslambda" // http.awslambda
	_ "github.com/nicolasazrak/caddy-cache" // http.cache
	_ "github.com/jung-kurt/caddy-cgi" // http.cgi
	_ "github.com/captncraig/cors" // http.cors // does not show up in plugin list?
	// _ "github.com/payintech/caddy-datadog" // http.datadog // fails to build
	_ "github.com/epicagency/caddy-expires" // http.expires
	// _ "github.com/filebrowser/caddy/filemanager" // http.filemanager // fails to build
	_ "github.com/echocat/caddy-filter" // http.filter
	_ "github.com/caddyserver/forwardproxy" // http.forwardproxy
	_ "github.com/kodnaplakal/caddy-geoip" // http.geoip
	_ "github.com/abiosoft/caddy-git" // http.git
	// _ "github.com/zikes/gopkg" // http.gopkg // fails to build
	_ "github.com/pieterlouw/caddy-grpc" // http.grpc
	_ "github.com/pyed/ipfilter" // http.ipfilter
	_ "github.com/BTBurke/caddy-jwt" // http.jwt
	// _ "github.com/simia-tech/caddy-locale" // http.locale // fails to build
	_ "github.com/tarent/loginsrv/caddy" // http.login
	_ "github.com/SchumacherFM/mailout" // http.mailout
	_ "github.com/hacdias/caddy-minify" // http.minify
	_ "github.com/Xumeiquer/nobots" // http.nobots
	_ "github.com/dhaavi/caddy-permission" // http.permission
	_ "github.com/miekg/caddy-prometheus" // http.prometheus
	_ "github.com/mastercactapus/caddy-proxyprotocol" // http.proxyprotocol
	_ "github.com/jung-kurt/caddy-pubsub" // http.pubsub
	_ "github.com/xuqingfeng/caddy-rate-limit" // http.ratelimit
	_ "github.com/captncraig/caddy-realip" // http.realip
	// _ "github.com/freman/caddy-reauth" // http.reauth // fails to build
	// _ "github.com/restic/caddy" // http.restic // fails to build
	_ "github.com/techknowlogick/caddy-s3browser" // http.s3browser
	// _ "github.com/lucaslorentz/caddy-supervisor" // http.supervisor // fails to build
	_ "go.okkur.org/torproxy" // http.torproxy
	_ "github.com/hacdias/caddy-webdav" // http.webdav
)

func main() {
	// optional: disable telemetry
	// caddymain.EnableTelemetry = false
	caddymain.Run()
}