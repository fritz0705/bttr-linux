PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../xz-5.0.4/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: xz-5.0.4.tar.gz
	tar xzf xz-5.0.4.tar.gz
	mkdir -p build
	touch prepare

xz-5.0.4.tar.gz:
	wget http://tukaani.org/xz/xz-5.0.4.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f xz-5.0.4.tar.gz
	rm -rf xz-5.0.4
