.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
ifeq ($(PREFIX),/usr)
	SYSCONFDIR?=/etc
else
	SYSCONFDIR?=$(PREFIX)/etc
endif
DESTDIR?=

VERSION?=1.14
FETCH?=curl -L --retry 3

all: build

fetch: wget-$(VERSION).tar.gz
unpack: wget-$(VERSION)/
patch: unpack
prepare: wget-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../wget-$(VERSION)/configure --prefix=$(PREFIX) \
		--with-ssl=openssl \
		--sysconfdir=$(SYSCONFDIR)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r wget-$(VERSION)/

distclean: clean
	$(RM) wget-$(VERSION).tar.gz

wget-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/wget/wget-$(VERSION).tar.gz > $@

wget-$(VERSION)/: wget-$(VERSION).tar.gz
	tar xzf $<

