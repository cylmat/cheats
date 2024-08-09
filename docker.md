### Build  

```
docker build --pull --rm -f ".\Dockerfile" -t name:latest "api" --build-arg="ARG=VAL" --target base --build-context context=".\"

docker compose down --remove-orphans
docker compose -f 'docker-compose.yml' up -d --build
```

### Daemon

sh -c "nohup sudo -b dockerd --default-ulimit nofile=8192:8192 < /dev/null > /mnt/wsl/shared-docker/dockerd.log 2>&1"  
sudo chmod a+x /var/run/docker.sock  
sudo vim /usr/lib/systemd/system/docker.service  

```
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
    commands: while true; do sleep 1; done
    commands: sleep infinity
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
docker run --entrypoint echo ubuntu "Hello World"
```

### restart
- docker compose -f docker-compose.yml restart user-request

# Error

- bug on windows:
~/.docker/config.json change credsStore to credStore

* if HOST NOT FOUND  
in /etc/wsl.conf:  
Remove/add [network] generateResolvConf = false 
