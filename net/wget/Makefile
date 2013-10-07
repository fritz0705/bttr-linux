.PHONY: all fetch unpack build install clean distclean

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

patch: | wget-$(VERSION)/
ifeq ($(VERSION),1.14)
	patch -d wget-$(VERSION)/ -p1 < pod-fixes-1.14.patch
endif
	@touch $@

ifeq ($(VERSION),1.14)
patch: pod-fixes-1.14.patch
endif

prepare: patch | wget-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare | wget-$(VERSION)/
	cd build && ../wget-$(VERSION)/configure --prefix=$(PREFIX) \
		--with-ssl=openssl \
		--sysconfdir=$(SYSCONFDIR)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure patch
	$(RM) -r build/
	$(RM) -r wget-$(VERSION)/

distclean: clean
	$(RM) wget-$(VERSION).tar.gz

wget-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/wget/wget-$(VERSION).tar.gz > $@

wget-$(VERSION)/: wget-$(VERSION).tar.gz
	tar xzf $<

