.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=0.7.6
FETCH?=curl -L --retry 3

all: build

fetch: userspace-rcu-$(VERSION).tar.bz2
unpack: userspace-rcu-$(VERSION)/
patch: unpack
prepare: userspace-rcu-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../userspace-rcu-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) -r build/
	$(RM) configure prepare
	$(RM) -r userspace-rcu-$(VERSION)/

distclean: clean
	$(RM) userspace-rcu-$(VERSION)/

userspace-rcu-$(VERSION)/: userspace-rcu-$(VERSION).tar.bz2
	tar xjf $<

userspace-rcu-$(VERSION).tar.bz2:
	$(FETCH) http://lttng.org/files/urcu/userspace-rcu-$(VERSION).tar.bz2 > $@


.PHONY: Version
Version:
	@echo $(VERSION) > $@

