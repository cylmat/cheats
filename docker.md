### Build  

```
docker build --pull --rm -f ".\Dockerfile" -t name:latest "api" --build-arg="ARG=VAL" --target base --build-context context=".\"
```
