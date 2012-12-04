PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../mpc-1.0.1/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: mpc-1.0.1.tar.gz
	tar xzf mpc-1.0.1.tar.gz
	mkdir -p build
	touch prepare

mpc-1.0.1.tar.gz:
	wget http://www.multiprecision.org/mpc/download/mpc-1.0.1.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f mpc-1.0.1.tar.gz
	rm -rf mpc-1.0.1

