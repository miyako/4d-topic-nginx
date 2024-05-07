# 4d-topic-nginx

## setup

```
brew fetch --bottle-tag=arm64_monterey nginx 
brew fetch --bottle-tag=x86_64_monterey nginx
brew fetch --bottle-tag=arm64_monterey pcre2
brew fetch --bottle-tag=x86_64_monterey pcre2
brew fetch --bottle-tag=arm64_monterey openssl@3
brew fetch --bottle-tag=x86_64_monterey openssl@3
```

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
