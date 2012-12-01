PREFIX=/usr
DESTDIR=

all: prepare
	cd zlib-1.2.7 && ./configure --prefix=$(PREFIX)
	$(MAKE) -C zlib-1.2.7

prepare: zlib-1.2.7.tar.gz
	tar xzf zlib-1.2.7.tar.gz
	touch prepare

zlib-1.2.7.tar.gz:
	wget http://zlib.net/zlib-1.2.7.tar.gz

install: all
	$(MAKE) -C zlib-1.2.7 install DESTDIR=$(DESTDIR)

clean:
	rm -f prepare
	rm -f zlib-1.2.7.tar.gz
	rm -rf zlib-1.2.7

