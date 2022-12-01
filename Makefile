SHELL:=/bin/bash

ARCH:=aarch64
PLATFORM:=rpi4

curPath:=$(abspath .)
srcPath:=$(curPath)/src
imgPath:=$(curPath)/sdcard

all: platform freertos

include platform.mk
include freertos.mk
include linux.mk

.PHONY: all 
