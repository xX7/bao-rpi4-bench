SHELL:=/bin/bash

ARCH:=aarch64
PLATFORM:=rpi4

curPath:=$(abspath .)
srcPath:=$(curPath)/src
imgPath:=$(curPath)/sdcard

all: dir platform freertos

dir:
	@mkdir -p $(imgPath)

include platform.mk
include freertos.mk
include linux.mk

.PHONY: dir all
