.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../Python-2.7.3/configure --prefix=$(PREFIX)
	@touch configure

prepare: Python-2.7.3.tar.bz2
	tar xjf Python-2.7.3.tar.bz2
	@mkdir build
	@touch prepare

Python-2.7.3.tar.bz2:
	wget http://python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) Python-2.7.3.tar.bz2
	$(RM) -r build/
	$(RM) -r Python-2.7.3/

