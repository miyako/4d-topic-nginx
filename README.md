# 4d-topic-nginx

## gist

instead of statically linking to `.a` files, one should compile 

* openssl
* pcre2

from source.

see https://gist.github.com/rjeczalik/7057434


the following options seem invalid:

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

must generate `configure` for `pcre` with `autogen.sh`


https://qiita.com/katzueno/items/44e02db2f1bfa0de5860
