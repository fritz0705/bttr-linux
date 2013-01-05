.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libevent-2.0.21-stable/configure --prefix=$(PREFIX)
	@touch configure

prepare: libevent-2.0.21-stable.tar.gz
	tar xzf libevent-2.0.21-stable.tar.gz
	@mkdir build
	@touch prepare

libevent-2.0.21-stable.tar.gz:
	wget https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libevent-2.0.21-stable.tar.gz
	$(RM) -r build/
	$(RM) -r libevent-2.0.21-stable/

