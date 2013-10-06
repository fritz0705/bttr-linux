.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
ifeq ($(PREFIX),/usr)
	EXECPREFIX?=
else
	EXECPREFIX?=$(PREFIX)
endif
DESTDIR?=

VERSION?=3.3.8
FETCH?=curl -L --retry 3

all: build

fetch: procps-ng-$(VERSION).tar.xz
unpack: procps-ng-$(VERSION)/
patch: unpack
prepare: | procps-ng-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../procps-ng-$(VERSION)/configure --prefix=$(PREFIX) --exec-prefix=$(EXECPREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r procps-ng-$(VERSION)/

distclean: clean
	$(RM) procps-ng-$(VERSION).tar.xz

procps-ng-$(VERSION).tar.xz:
	$(FETCH) http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-$(VERSION).tar.xz > $@

procps-procps/: procps-ng-$(VERSION).tar.xz
	tar xJf $<

