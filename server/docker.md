```
sudo sed -i "s/10.0.2.3/8.8.8.8/g" /etc/resolv.conf
sudo test ! -e /DIR && sudo mkdir /DIR
sudo mount -t vboxsf DIR /DIR
```

* Error: mount a directory into a file (or vice-versa)
/DIR/application/data_local_directory:/data_docker_directory  (if error, reboot)

- /DIR/id-magento2-appli:/var/www/magento
(DIR repertoire créé dans VirtualBox)

instead of
- ./id-magento2-appli:/var/www/magento

APACHE
---
https://blog.silarhi.fr/image-docker-php-apache-parfaite/

# tips:
###################### Dans VirtualBox
-> ajouter un repertoire Docker partagé
###################### docker-machine ssh
sudo sed -i "s/10.0.2.3/8.8.8.8/g" /etc/resolv.conf &&
sudo mkdir /VMshare &&
sudo mount -t vboxsf Docker /VMshare &&
sudo mount -t vboxsf REF /REF

tips arguments
--------------
- in compose.yml
args:
  servername: "my.url_website"
  buildno: 1
- in dockerfile
  ARG buildno
  ARG servername
  RUN echo "Build number: $buildno from $servername"

/**
* //tip:
    * 8.8.8.8 resolv
    * declare same name dir shared (vbox) with mounted in ssh machine (without /)
    * Dfile workdir from durrent, dcompse workdir from shareddir (with/)
    * shareddir (in Win) with 755, modif inside Dfile at end of build
    * verif php extnension are presents
    * /bin/bash -c ".. && .. && ..." dcompose
    * dcompose: volume left only (not xxx:xxx) kepp them from overriding
*/

command: /bin/bash -c "apt-get update
    && apt-get install -y default-mysql-client
    && docker-php-ext-install pdo_mysql
    && apache2-foreground"

#For mac
eval "$(docker-machine env default)"

Launch multiple service, ex:
ENTRYPOINT /etc/init.d/ssh start && /container/tool/run

## COPY
command: --copy-service

SSH
https://docs.docker.com/engine/examples/running_ssh_service/

# CMD vs ENTRY
    CMD sets default command and/or parameters, which can be overwritten from command line when docker container runs.
    ENTRYPOINT configures a container that will run as an executable.

ENTRYPOINT+ CMD= arguments de la commande du conteneur par défaut 

```
ENTRYPOINT ["/bin/chamber", "exec", "production", "--"] CMD ["/bin/service", "-d"]
En réunissant les commandes, les arguments par défaut du conteneur seront ["/bin/chamber","exec", "production", "--","/bin/service", "-d"].

FOR MAC
# .bash_profile

# eval $(docker-machine env default)
# Error checking TLS connection: Host is not running
# Run docker-machine start before
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/camillemaurice/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"


COPY && SOURCES
COPY --from=composer:1.8 /usr/bin/composer /usr/bin/
# This dockerfile is optimized to have efficient layers caching.
# for example composer install is ran only if composer related files are updated.
# also modifying source, would not need to rebuild extensions layer.
# Author: Elan Ruusamäe <glen@pld-linux.org>
FROM php:7.3-fpm-alpine AS base
RUN set -x \
    && apk add --no-cache --virtual .build-deps ${PHPIZE_DEPS} \
    && pecl install mongodb && docker-php-ext-enable mongodb \
    && apk del .build-deps
# prepare sources
FROM scratch AS source
WORKDIR /app
COPY . .
# mkdir "vendor" dir, so the next stage can use external vendor optionally
WORKDIR /app/vendor
# install composer vendor
FROM base AS build
WORKDIR /app
ARG COMPOSER_FLAGS="--no-interaction --no-suggest --ansi --no-dev"
COPY --from=composer:1.8 /usr/bin/composer /usr/bin/
COPY --from=source /app/composer.* ./
COPY --from=source /app/vendor ./vendor
# install in two steps to cache composer run based on composer.* files
RUN composer require --update-no-dev --no-scripts alcaeus/mongo-php-adapter ^1.1
RUN composer install $COMPOSER_FLAGS --no-scripts --no-autoloader
# copy rest of the project. copy in order that is least to most changed
COPY --from=source /app/webroot ./webroot
COPY --from=source /app/src ./src
COPY --from=source /app/config ./config
# second run to invoke (possible) scripts and create autoloader
RUN composer install $COMPOSER_FLAGS --classmap-authoritative
# not needed runtime, cleanup
#RUN rm -vf composer.* vendor/composer/*.json
# build runtime image
FROM base
#ARG APPDIR=/app
ARG APPDIR=/var/www/xhgui
ARG WEBROOT=$APPDIR/webroot
WORKDIR $APPDIR
#add
COPY --from=composer:1.8 /usr/bin/composer /usr/bin/
RUN mkdir -p cache && chmod -R 777 cache
COPY --from=build /app $APPDIR/
```

```
Docker
# https://docs.docker.com/engine/reference/builder/#dockerignore-file
# exclude all, whitelist only wanted context
/*
!/composer.*
!/config/
!/docker/
!/src/
!/vendor/
!/webroot/
```
