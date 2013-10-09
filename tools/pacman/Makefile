### DEFINITIONS

PREFIX ?= /usr
DESTDIR ?=
FETCH ?= curl -L --retry 3
VERSION = 4.1.2

.PHONY: fetch unpack patch prepare configure build all install clean distclean

### DEFAULT TARGETS

all: build

fetch: pacman-$(VERSION).tar.gz
unpack: pacman-$(VERSION)
patch: pacman-$(VERSION)
prepare: build/
configure: build/Makefile
build:
install:
clean:
distclean:

### SOURCE FILES

pacman-$(VERSION): pacman-$(VERSION).tar.gz
	tar xzf $<

pacman-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.archlinux.org/other/pacman/pacman-$(VERSION).tar.gz > $@

### PREPARATION

build/:
	mkdir $@

### CONFIGURATION

build/Makefile: build/ pacman-$(VERSION)
	cd build && ../pacman-$(VERSION)/configure --prefix=$(PREFIX)

### BUILD

build: build/Makefile
	$(MAKE) -C build/

### INSTALL

install: build
	$(MAKE) -C build/ install

### CLEAN

clean:
	$(RM) -r build/
	$(RM) -r pacman-$(VERSION)

distclean: clean
	$(RM) pacman-$(VERSION).tar.gz


.PHONY: Version
Version:
	@echo $(VERSION) > $@

