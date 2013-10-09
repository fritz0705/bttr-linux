.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=3.0.4
FETCH?=curl -L --retry 3

all: build

fetch: gperf-$(VERSION).tar.gz
unpack: gperf-$(VERSION)/
patch: unpack
prepare: gperf-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../gperf-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r gperf-$(VERSION)/

distclean: clean
	$(RM) gperf-$(VERSION).tar.gz

gperf-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/gperf/gperf-$(VERSION).tar.gz > $@

gperf-$(VERSION)/: gperf-$(VERSION).tar.gz
	tar xzf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

