PREFIX=/usr
DESTDIR=

all: prepare
	cd iproute2-3.6.0 && ./configure
	$(MAKE) -C iproute2-3.6.0

prepare: iproute2-3.6.0.tar.gz
	tar xzf iproute2-3.6.0.tar.gz
	mkdir -p build
	touch prepare

iproute2-3.6.0.tar.gz:
	wget http://kernel.org/pub/linux/utils/net/iproute2/iproute2-3.6.0.tar.gz

install: all
	$(MAKE) -C iproute2-3.6.0 DESTDIR=$(DESTDIR) install

clean:
	rm -rf build/
	rm -f prepare
	rm -rf iproute2-3.6.0
	rm -f iproute2-3.6.0.tar.gz

