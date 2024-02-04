MAKEFILE

export .PHONY: cn.* heimdall.* api.* vdm.* front.* signal.* user-request.* init help up down reload ps logs default: help ${MAKE} front.install
