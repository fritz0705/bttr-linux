.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
SYSCONFDIR=$(PREFIX)/etc
LOCALSTATEDIR=$(PREFIX)/var
DESTDIR=

VERSION=1.3.9
FETCH=curl

ifeq ($(PREFIX),/usr)
SYSCONFDIR=/etc
LOCALSTATEDIR=/var
endif

ifeq ($(WITH_IPV6),yes)
override opt_WITH_IPV6 = --enable-ipv6
endif

all: build

fetch: bird-$(VERSION).tar.gz
unpack: bird-$(VERSION)/
patch: unpack
prepare: bird-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../bird-$(VERSION)/configure --prefix=$(PREFIX) --sysconfdir=$(SYSCONFDIR) --localstatedir=$(LOCALSTATEDIR) $(opt_WITH_IPV6)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r bird-$(VERSION)/

distclean: clean
	$(RM) bird-$(VERSION).tar.gz

bird-$(VERSION).tar.gz:
	$(FETCH) ftp://bird.network.cz/pub/bird/bird-$(VERSION).tar.gz > $@

bird-$(VERSION)/: bird-$(VERSION).tar.gz
	tar xzf $<

