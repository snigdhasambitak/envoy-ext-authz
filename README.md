# Envoy example

## How to run?

1. Run `docker-compose up`
2. Send the request to Envoy proxy.

```shell
# Bad token
$ curl -v -H "Authorization: Bearer baz"  localhost:9000

< HTTP/1.1 401 Unauthorized
< content-length: 21
< content-type: text/plain
< date: Wed, 01 Dec 2021 12:26:35 GMT
< server: envoy

# Authorized token
$ curl -v -H "Authorization: Bearer baz"  localhost:9000

< HTTP/1.1 200 OK
< server: envoy
< date: Wed, 01 Dec 2021 12:26:35 GMT
< content-type: text/html; charset=utf-8
< content-length: 381
< x-envoy-upstream-service-time: 8

# Check the header in the backend
user-agent: curl/7.64.1
accept: */*
authorization: Bearer foo
x-forwarded-proto: http
x-request-id: d1ef3edb-2851-4e14-8724-af14e0e9e4c4
foo: baz        # <-- Additional header.
x-envoy-expected-rq-timeout-ms: 15000
content-length: 0
```
3. Clean up, `docker-compose down --remove-orphans`
