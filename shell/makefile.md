# Makefile

```
SHELL := /bin/bash  
.PHONY: args useful_command  

define useful_command  
	command with args "${1}" "${2}"  
endef

call-command:  
	@$(call useful_command, arg1, args2)
```

** Double $$ **  
kill $$(ps | grep php | awk '{print $$1}')

```
depend-command:
	echo 1
	
another-one: depend-command
	echo 2
```

**Call it with MY_ARG="whatever" make args**  
```
MY_ARG?=default_value
args:  
	@echo "${MY_ARG}"
```

####################
# Only tabs allowed
# 
# Check with:
# cat -etv Makefile
####################
