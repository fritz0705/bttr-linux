.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
ifeq ($(PREFIX),/usr)
SBINDIR?=/usr/bin
SYSCONFDIR?=/etc/ssh
LIBEXECDIR?=/usr/lib/ssh
else
SBINDIR?=$(PREFIX)/sbin
SYSCONFDIR?=$(PREFIX)/etc/ssh
LIBEXECDIR?=$(PREFIX)/lib/ssh
endif

DESTDIR?=
VERSION?=6.3p1
FETCH?=curl -L --retry 3

override CONFIGURE_FLAGS := --prefix=$(PREFIX) \
	--sbindir=$(SBINDIR) \
	--sysconfdir=$(SYSCONFDIR) \
	--libexecdir=$(LIBEXECDIR) \
	--with-ldns \
	--with-libedit \
	--with-ssl-engine \
	--with-pam \
	--with-privsep-user=nobody \
	$(CONFIGURE_FLAGS)

all: build

fetch: openssh-$(VERSION).tar.gz
unpack: | openssh-$(VERSION)/
patch: unpack
prepare: | openssh-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../openssh-$(VERSION)/configure $(CONFIGURE_FLAGS)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) -r build/
	$(RM) configure prepare
	$(RM) -r openssh-$(VERSION)/

distclean: clean
	$(RM) openssh-$(VERSION).tar.gz

openssh-$(VERSION)/: openssh-$(VERSION).tar.gz
	tar xaf $<

openssh-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-$(VERSION).tar.gz > $@

