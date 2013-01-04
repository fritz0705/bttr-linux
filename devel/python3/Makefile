.PHONY: all build install clean

PREFIX=/usr
DESTDIR=
VERSION=3.3.0

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../Python-$(VERSION)/configure --prefix=$(PREFIX)
	@touch configure

prepare: Python-$(VERSION).tgz
	tar xzf Python-$(VERSION).tgz
	@mkdir build
	@touch prepare

Python-$(VERSION).tgz:
	wget http://python.org/ftp/python/$(VERSION)/Python-$(VERSION).tgz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) Python-$(VERSION).tgz
	$(RM) -r build/
	$(RM) -r Python-$(VERSION)/

