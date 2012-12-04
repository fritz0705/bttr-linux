PREFIX=/usr
DESTDIR=

all: prepare
	$(MAKE) -C iputils-s20121126

prepare: iputils-s20121126.tar.bz2
	tar xjf iputils-s20121126.tar.bz2
	mkdir -p build
	touch prepare

iputils-s20121126.tar.bz2:
	wget http://www.skbuff.net/iputils/iputils-s20121126.tar.bz2

install: all
	./install.sh iputils-s20121126 "$(DESTDIR)" $(PREFIX)

clean:
	rm -rf build/
	rm -f prepare
	rm -f iputils-s20121126.tar.bz2
	rm -rf iputils-s20121126

