.PHONY: all fetch unpack patch prepare configure build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=3.54
FETCH?=curl -L --retry 3

all: build

fetch: man-pages-$(VERSION).tar.gz
unpack: man-pages-$(VERSION)/
patch: unpack
prepare: patch
configure: prepare
build: configure

install: build
	$(MAKE) -C man-pages-$(VERSION) install prefix=$(PREFIX) DESTDIR=$(DESTDIR)

clean:
	$(RM) -r man-pages-$(VERSION)/

distclean: clean
	$(RM) man-pages-$(VERSION).tar.gz

man-pages-$(VERSION).tar.gz:
	$(FETCH) http://www.kernel.org/pub/linux/docs/man-pages/man-pages-$(VERSION).tar.gz > $@

man-pages-$(VERSION)/: man-pages-$(VERSION).tar.gz
	tar xzf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

