![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)
[![license](https://img.shields.io/github/license/miyako/4d-topic-nginx)](LICENSE)
![downloads](https://img.shields.io/github/downloads/miyako/4d-topic-nginx/total)

# 4d-topic-nginx

## gist

build a static, portable nginx executable with minimal features (i.e. HTTPS proxy).

instead of statically linking to `.a` files, one should compile 

* openssl
* pcre2

from source.

see https://gist.github.com/rjeczalik/7057434

**Note**: the above information is for Linux circa 2015. the following options seem invalid:

* `--with-cc-opt="-static -static-libgcc"`
* `--with-ld-opt="-static"`
* `--with-http_spdy_module`
* `--with-rtsig_module`

passing the following option:

* `--with-cc-opt`

causes error "can not detect int size"

so...

```
./auto/configure --prefix=/opt/nginx \
    --with-http_ssl_module --with-openssl=../openssl-3.3.0 \
    --with-pcre=../pcre2-10.43
```

**Note**: `--with-http_ssl_module` is necessary in addition to `--with-openssl`.

one must first generate `configure` for `pcre` with `autogen.sh`.

## more

addtional options used in release

```
./auto/configure --prefix=/opt/nginx \
    --with-http_ssl_module --with-openssl=../openssl-3.3.0 \
    --with-pcre=../pcre2-10.43 \
    --with-http_stub_status_module \
    --with-http_realip_module \
    --with-http_auth_request_module \
    --with-threads \
    --with-stream \
    --with-stream_ssl_module \
    --with-stream_realip_module \
    --with-stream_ssl_preread_module \
    --with-http_v2_module \
    --with-http_slice_module \
    --with-http_gzip_static_module \
    --with-http_sub_module
```
