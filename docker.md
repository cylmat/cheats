### Build  

```
docker build --pull --rm -f ".\Dockerfile" -t name:latest "api" --build-arg="ARG=VAL" --target base --build-context context=".\"
```

### Daemon

sh -c "nohup sudo -b dockerd --default-ulimit nofile=8192:8192 < /dev/null > /mnt/wsl/shared-docker/dockerd.log 2>&1"  

### Compose

docker compose -f "docker-compose.yaml" up -d --build   

```
# multi commands
s_name:
  command:
    - redis-server
    - --appendonly
    - -param2
    - -c3
    - etc...

# ext networks
networks:
    default:
      external: true
      name: user-request-v2
```
 
