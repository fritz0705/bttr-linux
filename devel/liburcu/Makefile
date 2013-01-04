.PHONY: all build install clean

PREFIX=/usr
DESTDIR=
VERSION=0.7.5

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../userspace-rcu-$(VERSION)/configure --prefix=$(PREFIX)
	@touch configure

prepare: userspace-rcu-$(VERSION).tar.bz2
	tar xjf userspace-rcu-$(VERSION).tar.bz2
	@mkdir build
	@touch prepare

userspace-rcu-$(VERSION).tar.bz2:
	wget http://lttng.org/files/urcu/userspace-rcu-$(VERSION).tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) userspace-rcu-$(VERSION).tar.bz2
	$(RM) -r build/
	$(RM) -r userspace-rcu-$(VERSION)/

