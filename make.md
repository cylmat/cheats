SHELL := /bin/bash

define useful_command
	docker exec -it -u www-data front_php_debug bash -c "cd /var/www && ${1}"
endef

# Call it with MY_ARG="whatever" make args 
args:
	@echo "${MY_ARG}"
