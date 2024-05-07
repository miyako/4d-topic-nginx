# 4d-topic-nginx

## gist

build a static, portable nginx executable with minimal features (i.e. HTTPS proxy).

instead of statically linking to `.a` files, one should compile 

* openssl
* pcre2

from source.

see https://gist.github.com/rjeczalik/7057434

**Note**: the above information is for Linux circa 2015. the following options seem invalid:

* `--with-ld-opt="-static"
* `--with-http_spdy_module`
* `--with-rtsig_module`

passing the following option:

* `--with-cc-opt`

causes error "can not detect int size"

so...

```
./auto/configure --prefix=/opt/nginx \
    --with-http_ssl_module --with-openssl=../openssl-openssl-3.3.0 \
    --with-pcre=../pcre2-pcre2-10.43
```

**Note**: `--with-http_ssl_module` is necessary in addition to `--with-openssl`.

one must first generate `configure` for `pcre` with `autogen.sh`.
