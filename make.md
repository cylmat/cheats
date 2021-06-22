# Makefile

SHELL := /bin/bash
.PHONY: args useful_command

define useful_command  
	command with args "${1}" "${2}"  
endef

call-command:
	@$(call useful_command, arg1, args2)

**Call it with MY_ARG="whatever" make args**  
args:  
	@echo "${MY_ARG}"
