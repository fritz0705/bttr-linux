.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
FETCH=curl
VERSION=1.8.6p7

all: build

fetch: sudo-$(VERSION).tar.gz
unpack: sudo-$(VERSION)/
patch: unpack
prepare: sudo-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../sudo-$(VERSION)/configure --prefix=$(PREFIX) \
		--with-logfac=auth --with-pam --with-env-editor \
		--with-passprompt="[sudo] password for %p: " \
		--with-all-insults
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r sudo-$(VERSION)/

distclean: clean
	$(RM) sudo-$(VERSION).tar.gz

sudo-$(VERSION).tar.gz:
	$(FETCH) http://www.sudo.ws/sudo/dist/sudo-$(VERSION).tar.gz > $@

sudo-$(VERSION)/: sudo-$(VERSION).tar.gz
	tar xzf $<

