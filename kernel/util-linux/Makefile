.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=

ifneq ($(PREFIX),/usr)
UNITDIR?=$(PREFIX)/etc/systemd/system
endif

VERSION?=2.23.2
FETCH?=curl -L --retry 3

override __CONFIGURE_FLAGS = --prefix=$(PREFIX) \
	--enable-fs-paths-extra=/usr/bin:/usr/sbin \
	--enable-raw \
	--enable-vipw \
	--enable-newgrp \
	--enable-chfn-chsh \
	--enable-write \
	--enable-mesg \
	--enable-socket-activation
ifdef UNITDIR
override __CONFIGURE_FLAGS += --with-systemdsystemunitdir=$(UNITDIR)
endif
override __CONFIGURE_FLAGS += $(CONFIGURE_FLAGS)

all: build

fetch: util-linux-$(VERSION).tar.gz
unpack: util-linux-$(VERSION)/
patch: unpack
prepare: util-linux-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../util-linux-$(VERSION)/configure $(__CONFIGURE_FLAGS)
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
	$(FETCH) ftp://ftp.kernel.org/pub/linux/utils/util-linux/v2.23/util-linux-$(VERSION).tar.gz > $@

util-linux-$(VERSION)/: util-linux-$(VERSION).tar.gz
	tar xzf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

