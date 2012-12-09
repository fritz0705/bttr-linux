.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C iputils-s20121126

configure: prepare
	@touch configure

prepare: iputils-s20121126.tar.bz2
	tar xjf iputils-s20121126.tar.bz2
	@mkdir build
	@touch prepare

iputils-s20121126.tar.bz2:
	wget http://www.skbuff.net/iputils/iputils-s20121126.tar.bz2

install: build
	./install.sh iputils-s20121126 "$(DESTDIR)" $(PREFIX)

clean:
	-rm prepare
	-rm configure
	-rm iputils-s20121126.tar.bz2
	-rm -r build/
	-rm -r iputils-s20121126

