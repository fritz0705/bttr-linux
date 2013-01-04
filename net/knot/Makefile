.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

SYSCONFDIR=$(PREFIX)/etc
LOCALSTATEDIR=$(PREFIX)/var

ifeq ($(PREFIX),/usr)
SYSCONFDIR=/etc/knot
LOCALSTATEDIR=/var
endif

all: build

build: configure
	$(MAKE) -C knot-1.1.3/

configure: prepare
	cd knot-1.1.3 && ./configure --prefix=$(PREFIX) --localstatedir=$(LOCALSTATEDIR) --sysconfdir=$(SYSCONFDIR)
	@touch configure

prepare: knot-1.1.3.tar.gz
	tar xzf knot-1.1.3.tar.gz
	@mkdir build
	@touch prepare

knot-1.1.3.tar.gz:
	wget https://secure.nic.cz/files/knot-dns/knot-1.1.3.tar.gz

install: build
	$(MAKE) -C knot-1.1.3/ install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) knot-1.1.3.tar.gz
	$(RM) -r build/
	$(RM) -r knot-1.1.3/

