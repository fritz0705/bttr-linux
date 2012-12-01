PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../shadow-4.1.5.1/configure \
		--prefix=$(PREFIX) \
		--with-libpam \
		--without-selinux
	$(MAKE) -C build

prepare: shadow-4.1.5.1.tar.gz
	tar xzf shadow-4.1.5.1.tar.gz
	mkdir -p build
	touch prepare

shadow-4.1.5.1.tar.gz:
	wget http://pkg-shadow.alioth.debian.org/releases/shadow-4.1.5.1.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f shadow-4.1.5.1.tar.gz
	rm -rf shadow-4.1.5.1

