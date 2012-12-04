PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../ppl-1.0/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: ppl-1.0.tar.gz
	tar xzf ppl-1.0.tar.gz
	mkdir -p build
	touch prepare

ppl-1.0.tar.gz:
	wget http://bugseng.com/products/ppl/download/ftp/releases/1.0/ppl-1.0.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f ppl-1.0.tar.gz
	rm -rf ppl-1.0

