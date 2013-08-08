.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=8.33
FETCH?=curl

all: build

fetch: pcre-$(VERSION).tar.gz
unpack: pcre-$(VERSION)/
patch: unpack
prepare: pcre-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../pcre-$(VERSION)/configure --prefix=$(PREFIX) \
		--enable-pcre16 --enable-pcre32 --enable-jit \
		--enable-utf --enable-unicode-properties
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r pcre-$(VERSION)/

distclean: clean
	$(RM) pcre-$(VERSION).tar.gz

pcre-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-$(VERSION).tar.gz > $@

pcre-$(VERSION)/: pcre-$(VERSION).tar.gz
	tar xzf $<

