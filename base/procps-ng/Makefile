.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
ifeq ($(PREFIX),/usr)
	EXECPREFIX?=
else
	EXECPREFIX?=$(PREFIX)
endif
DESTDIR?=

VERSION?=3.3.7
FETCH?=curl

all: build

fetch: procps-ng-$(VERSION).tar.gz
unpack: procps-procps/
patch: unpack
prepare: | procps-procps/
	mkdir build/
	@touch $@

configure: prepare
	cd procps-procps && ./autogen.sh
	cd build && ../procps-procps/configure --prefix=$(PREFIX) --exec-prefix=$(EXECPREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r procps-procps/

distclean: clean
	$(RM) procps-ng-$(VERSION).tar.gz

procps-ng-$(VERSION).tar.gz:
	$(FETCH) http://gitorious.org/procps/procps/archive-tarball/v$(VERSION) > $@

procps-procps/: procps-ng-$(VERSION).tar.gz
	tar xzf $<

