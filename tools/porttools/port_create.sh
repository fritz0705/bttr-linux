#!/bin/sh
# pkg_create NAME

mkdir -p $1
cd $1

[ -f Makefile ] && mv Makefile Makefile.old
cat > Makefile <<MAKEFILE
.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	# Build instructions

configure: prepare
	# Configuration instructions
	@touch configure

prepare:
	# Prepare instructions
	@mkdir build
	@touch prepare

install: build
	# Installation instructions

clean:
	\$(RM) prepare
	\$(RM) configure
	\$(RM) -r build/
MAKEFILE

if [ -f .gitignore ]
then
	# Merge .gitignore
	mv .gitignore .gitignore.old
	cat >> .gitignore.old <<GITIGNORE
prepare
configure
build/
GITIGNORE
	sort .gitignore.old | uniq > .gitignore
	rm .gitignore.old
else
	cat > .gitignore <<GITIGNORE
prepare
configure
build/
GITIGNORE
fi

