.PHONY: all build install clean

PREFIX=/usr
SYSCONFDIR=$(PREFIX)/etc
LOCALSTATEDIR=$(PREFIX)/var
DESTDIR=

ifeq ($(PREFIX),/usr)
SYSCONFDIR=/etc
LOCALSTATEDIR=/var
endif

ifeq ($(WITH_IPV6),yes)
override opt_WITH_IPV6 = --enable-ipv6
endif

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../bird-1.3.8/configure --prefix=$(PREFIX) --sysconfdir=$(SYSCONFDIR) --localstatedir=$(LOCALSTATEDIR) $(opt_WITH_IPV6)
	@touch configure

prepare: bird-1.3.8.tar.gz
	tar xzf bird-1.3.8.tar.gz
	@mkdir build
	@touch prepare

bird-1.3.8.tar.gz:
	wget ftp://bird.network.cz/pub/bird/bird-1.3.8.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) bird-1.3.8.tar.gz
	$(RM) -r build/
	$(RM) -r bird-1.3.8/

