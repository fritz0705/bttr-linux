.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=

VERSION?=2.22.2
FETCH?=curl

all: build

fetch: util-linux-$(VERSION).tar.gz
unpack: util-linux-$(VERSION)/
patch: unpack
prepare: util-linux-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../util-linux-$(VERSION)/configure --prefix=$(PREFIX) \
		--enable-fs-paths-extra=/usr/bin:/usr/sbin \
		--enable-raw \
		--enable-vipw \
		--enable-newgrp \
		--enable-chfn-chsh \
		--enable-write \
		--enable-mesg \
		--enable-socket-activation
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	sed -i -e 's/\tchgrp/\t-chgrp/' build/Makefile
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r util-linux-$(VERSION)/

distclean: clean
	$(RM) util-linux-$(VERSION).tar.gz

util-linux-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.kernel.org/pub/linux/utils/util-linux/v$(VERSION)/util-linux-$(VERSION).tar.gz > $@

util-linux-$(VERSION)/: util-linux-$(VERSION).tar.gz
	tar xzf $<

