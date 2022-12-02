SHELL:=/bin/bash

ARCH:=aarch64
PLATFORM:=rpi4

curPath:=$(abspath .)
srcPath:=$(curPath)/src
imgPath:=$(curPath)/sdcard
confPath:=$(curPath)/configs

all: dir platform freertos linux bao

dir:
	@mkdir -p $(imgPath)

include platform.mk
include freertos.mk
include linux.mk
include bao.mk

.PHONY: dir all
