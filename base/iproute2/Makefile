.PHONY: all fetch unpack patch prepare build install clean distclean

PREFIX?=/usr
ifeq ($(PREFIX),/usr)
SBINDIR?=/sbin
CONFDIR?=/etc/iproute2
ARPDDIR?=/var/lib/arpd
else
SBINDIR?=$(PREFIX)/sbin
CONFDIR?=$(PREFIX)/etc/iproute2
ARPDDIR?=$(PREFIX)/var/lib/arpd
endif

DESTDIR?=

VERSION?=3.10.0
FETCH?=curl -L

ifeq ($(VERSION),GIT)
GIT_REVISION ?= master
endif

all: build

fetch: iproute2-$(VERSION).tar.gz
unpack: iproute2-$(VERSION)/
patch: unpack
prepare: iproute2-$(VERSION)/

configure: prepare
	cd iproute2-$(VERSION) && ./configure
	@touch $@

build: configure
	$(MAKE) -C iproute2-$(VERSION) PREFIX=$(PREFIX)

install: build
	$(MAKE) -C iproute2-$(VERSION) DESTDIR=$(DESTDIR) \
		SBINDIR=$(SBINDIR) CONFDIR=$(CONFDIR) ARPDDIR=$(ARPDIR) \
		install

clean:
	$(RM) prepare configure
	$(RM) -r build/
ifneq ($(VERSION),GIT)
	$(RM) -r iproute2-$(VERSION)/
endif

distclean: clean
	$(RM) iproute2-$(VERSION).tar.gz

ifeq ($(VERSION),GIT)
.PHONY: iproute2-GIT
iproute2-GIT/:
	[ -d $@ ] && (git --git-dir=$@/.git pull) || (git clone git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git $@)
	git --git-dir=$@/.git pull
	git --git-dir=$@/.git checkout $(GIT_REVISION)
else
iproute2-$(VERSION).tar.gz:
	$(FETCH) http://kernel.org/pub/linux/utils/net/iproute2/iproute2-$(VERSION).tar.gz > $@

iproute2-$(VERSION)/: iproute2-$(VERSION).tar.gz
	tar xzf $<
endif

