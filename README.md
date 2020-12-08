Run OPA (v0.25.2 and newer):

```
opa run --server --authentication token --authorization basic .
```

Inside another terminal:

```
# allowed
curl localhost:8181/v1/data/example/echo -d '{"input": {"app": "foo"}}' -H 'Authorization: Bearer alice'

# allowed
curl localhost:8181/v1/data/example/echo -d '{"input": {"app": "bar"}}' -H 'Authorization: Bearer bob'

# denied
curl localhost:8181/v1/data/example/echo -d '{"input": {"app": "bar"}}' -H 'Authorization: Bearer alice'

# denied
curl localhost:8181/v1/data/example/echo -d '{"input": {"app": "foo"}}' -H 'Authorization: Bearer bob'

# denied
curl localhost:8181/v1/data/example/echo -d '{"input": {"app": "foo"}}' -H 'Authorization: Bearer eve'
```