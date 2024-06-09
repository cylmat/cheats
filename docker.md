### Build  

```
docker build --pull --rm -f ".\Dockerfile" -t name:latest "api" --build-arg="ARG=VAL" --target base --build-context context=".\"
```

### Daemon

sh -c "nohup sudo -b dockerd --default-ulimit nofile=8192:8192 < /dev/null > /mnt/wsl/shared-docker/dockerd.log 2>&1"  

...
# Docker
DOCKER_DISTRO="Ubuntu"
DOCKER_DIR="/mnt/wsl/shared-docker"
DOCKER_SOCK="$DOCKER_DIR/docker.sock"
export DOCKER_HOST="unix://$DOCKER_SOCK"
if [ ! -S "$DOCKER_SOCK" ]; then
   mkdir -pm o=,ug=rwx "$DOCKER_DIR"
   sudo chgrp docker "$DOCKER_DIR"
   /mnt/c/Windows/System32/wsl.exe -d $DOCKER_DISTRO sh -c "nohup sudo -b dockerd --default-ulimit nofile=8192:8192 < /dev/null > $DOCKER_DIR/dockerd.log 2>&1"
fi
```

### Compose

docker compose -f "docker-compose.yaml" up -d --build  

```
* run indefinitely
services-name:
    commands: tail -f /dev/null 
```

ip:
```
ipam:
    driver: default
    config:
        - subnet: "${SUBNET:-172.21.21}.0/24"
    ipv4_address: "${SUBNET:-172.21.21}.10"
```

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

### profiles

```
services-name:
    profiles:
        - myProfil

use:
COMPOSE_PROFILES=debug docker compose up
docker compose --profile myProfil up
```

### cli

```
- cli
docker run --entrypoint echo ubuntu "Hello World"
docker run ubuntu tail -f /dev/null
docker run ubuntu while true; do sleep 1; done
docker run ubuntu sleep infinity
```

# Error

- bug on windows:
~/.docker/config.json change credsStore to credStore

* if HOST NOT FOUND  
in /etc/wsl.conf:  
Remove/add [network] generateResolvConf = false 
