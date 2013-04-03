.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=7.29.0
FETCH?=curl

all: build

fetch: curl-$(VERSION).tar.gz
unpack: curl-$(VERSION)/
patch: unpack
prepare: curl-$(VERSION)/
	mkdir build
	@touch $@

configure: prepare
	cd build && ../curl-$(VERSION)/configure --prefix=$(PREFIX) \
		--disable-ldap \
		--disable-ldaps \
		--enable-ipv6 \
		--enable-manual \
		--enable-versioned-symbols \
		--enable-threaded-resolver \
		--with-random=/dev/urandom \
		--without-librtmp
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r curl-$(VERSION)/

distclean: clean
	$(RM) -r curl-$(VERSION).tar.gz

curl-$(VERSION).tar.gz:
	$(FETCH) http://curl.haxx.se/download/curl-$(VERSION).tar.gz > $@

curl-$(VERSION)/: curl-$(VERSION).tar.gz
	tar xzf $<

