.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../mpc-1.0.1/configure --prefix=$(PREFIX)
	@touch configure

prepare: mpc-1.0.1.tar.gz
	tar xzf mpc-1.0.1.tar.gz
	@mkdir build
	@touch prepare

mpc-1.0.1.tar.gz:
	wget http://www.multiprecision.org/mpc/download/mpc-1.0.1.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) mpc-1.0.1.tar.gz
	$(RM) -r build/
	$(RM) -r mpc-1.0.1/

