# 4d-topic-nginx

## gist

instead of statically linking to `.a` files, one should compile 

* openssl
* pcre2

from source.


$ ./configure
  --with-pcre=
  --with-http_ssl_module
  --with-openssl=

```
export LDFLAGS="-L.../lib -lcrypto -lssl -llibpcre2-8 -llibpcre2-16 -llibpcre2-32 -llibpcre2-posix"
export LIBS=" -lcrypto -lssl -llibpcre2-8 -llibpcre2-16 -llibpcre2-32 -llibpcre2-posix"
export CFLAGS="-I.../include -I.../include/openssl"
```

## execute

```
nginx
nginx -s stop
```

https://qiita.com/katzueno/items/44e02db2f1bfa0de5860
