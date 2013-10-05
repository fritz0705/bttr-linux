.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=5.15
FETCH?=curl

all: build

fetch: file-$(VERSION).tar.gz
unpack: file-$(VERSION)/
patch: unpack
prepare: file-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../file-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r file-$(VERSION)/

distclean: clean
	$(RM) file-$(VERSION).tar.gz

file-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.astron.com/pub/file/file-$(VERSION).tar.gz > $@

file-$(VERSION)/: file-$(VERSION).tar.gz
	tar xzf $<

