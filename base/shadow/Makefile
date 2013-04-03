.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
ifeq ($(PREFIX),/usr)
	SYSCONFDIR?=/etc
else
	SYSCONFDIR?=$(PREFIX)/etc
endif
DESTDIR?=

VERSION?=4.1.5.1
FETCH?=curl

all: build

fetch: shadow-$(VERSION).tar.gz
unpack: shadow-$(VERSION)/
patch: unpack
prepare: shadow-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../shadow-$(VERSION)/configure \
		--prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR) \
		--with-libpam \
		--without-selinux
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)
	# XXX Move this to a etc/shadow package?
	install -Dm744 useradd.defaults $(DESTDIR)/etc/default/useradd
	install -Dm644 login.defs $(DESTDIR)/etc/login.defs
	install -dm755 $(DESTDIR)/etc/pam.d
	install -t $(DESTDIR)/etc/pam.d -m644 passwd chgpasswd chpasswd newusers

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r shadow-$(VERSION)/

distclean: clean
	$(RM) shadow-$(VERSION).tar.gz

shadow-$(VERSION).tar.gz:
	$(FETCH) http://pkg-shadow.alioth.debian.org/releases/shadow-$(VERSION).tar.gz > $@

shadow-$(VERSION)/: shadow-$(VERSION).tar.gz
	tar xzf $<

