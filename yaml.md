# Yaml

```
x-kong-config:
  &kong-env
  KONG_DATABASE: ${KONG_DATABASE:-off}

services:
  kong-migrations:
    environment:
      <<: *kong-env
```

Ref
- https://docs.fileformat.com/fr/programming/yaml/
