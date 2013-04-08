PACKAGES := $(shell find ./ -mindepth 1 -name Makefile -type f -printf "%h\n")
