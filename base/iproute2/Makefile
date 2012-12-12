.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C iproute2-3.6.0

configure: prepare
	cd iproute2-3.6.0 && ./configure
	@touch configure

prepare: iproute2-3.6.0.tar.gz
	tar xzf iproute2-3.6.0.tar.gz
	@mkdir build
	@touch prepare

iproute2-3.6.0.tar.gz:
	wget http://kernel.org/pub/linux/utils/net/iproute2/iproute2-3.6.0.tar.gz

install: build
	$(MAKE) -C iproute2-3.6.0 DESTDIR=$(DESTDIR) PREFIX=$(PREFIX) install

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) iproute2-3.6.0.tar.gz
	$(RM) -r build/
	$(RM) -r iproute2-3.6.0/

