### Build  

use https://hub.docker.com/r/moby/buildkit  
```
docker build --pull --rm -f ".\Dockerfile" -t name:latest "api" --build-arg="ARG=VAL" --target base --build-context context=".\"

docker compose down --remove-orphans
docker compose -f 'docker-compose.yml' up -d --build
```

from remote
```
# in case of manual build :
docker build --tag dockerregistry.azurecr.io/sites:0.56.6  --build-arg BUILD_VERSION=0.56.6 .
docker push dockerregistry.azurecr.io/sites:0.56.6
```

### cli

```
docker run --entrypoint echo ubuntu "Hello World"
```

### Command as user

```
docker compose exec sites su nginx -s /bin/sh -c "php -d memory_limit=-1 bin/console doctrine:fixtures:load --no-interaction"
```

### Daemon

sh -c "nohup sudo -b dockerd --default-ulimit nofile=8192:8192 < /dev/null > /mnt/wsl/shared-docker/dockerd.log 2>&1"  
sudo chmod a+x /var/run/docker.sock   
sudo groupadd docker  
ls /var/run/docker.sock -la  
sudo vim /usr/lib/systemd/system/docker.service  

sudo apt search nftables | grep ^i  
sudo update-alternatives --config iptables  

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

### DNS

```
Option A: Set DNS in docker run
docker run --dns=1.1.1.1 --dns=8.8.8.8 <your-image> npm install

Option B: Set DNS in Docker daemon globally
    Edit Docker daemon config:
    On Linux: /etc/docker/daemon.json
    On Windows (Docker Desktop): Settings → Docker Engine
{
  "dns": ["1.1.1.1", "8.8.8.8"]
}
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
 
  entrypoint: >
	 /bin/sh -c "
		mc alias set myminio http://minio:9000 minioadmin minioadmin
	 "

# current pid
   service:
      environnment:
        - PUID=${PUID}
        - PGID=${PGID}

# ext networks
networks:
    my_ext_networks:
      external: true
      name: default_existing_networks
```

### heredoc

```
RUN cat <<EOF > /tmp/run_docker.sh
#!/usr/bin/env bash
for r in "\$@"; do cat "/tmp/recipes/\${r}" | sh; done
EOF
```

### optimization php

```
#!/bin/bash

if [ "$APP_ENV" == "dev" ]; then
    echo "optimization OFF"
else
    echo "optimization ON"
    echo "add opcache optimization"
    echo "opcache.memory_consumption=256" >> /usr/local/etc/php/conf.d/docker-vars.ini
    echo "opcache.max_accelerated_files=20000" >> /usr/local/etc/php/conf.d/docker-vars.ini
    echo "opcache.validate_timestamps=0" >> /usr/local/etc/php/conf.d/docker-vars.ini
    echo "realpath_cache_size=4096K" >> /usr/local/etc/php/conf.d/docker-vars.ini
    echo "realpath_cache_ttl=600" >> /usr/local/etc/php/conf.d/docker-vars.ini
fi
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

### remote connection

```
docker run --rm -it mysql --name mysql-client /bin/bash  
```

### stop running containers

```
# stop all running container
docker stop $(docker ps -aq)
```

### volume

Remove all dangling
```
docker volume rm $(docker volume ls -qf dangling=true)
```

### restart
- docker compose -f docker-compose.yml restart user-request

---

# Error

bug on windows:
```
~/.docker/config.json -> change credsStore to credStore
```

_zshz_update_datafile:print:57: write error: no space left on device
```
docker system df
docker system prune -a --volumes
```

if HOST NOT FOUND
```
in /etc/wsl.conf:  
Remove/add [network] generateResolvConf = false
```

Error "is the daemon running ?"
```
- journalctl -xeu docker.service
   - docker.service: Start request repeated too quickly.
   - docker.service: Failed with result 'exit-code'.

solve:
- sudo vim /usr/lib/systemd/system/docker.service
- add  ExecStart=/usr/bin/dockerd  --data-root /home/docker
- systemctl daemon-reload
- sudo service docker start
```
