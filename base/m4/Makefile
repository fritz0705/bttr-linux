PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../m4-1.4.16/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: m4-1.4.16.tar.gz
	tar xzf m4-1.4.16.tar.gz
	sed -i -e '/gets is a/d' m4-1.4.16/lib/stdio.in.h
	mkdir -p build
	touch prepare

m4-1.4.16.tar.gz:
	wget ftp://ftp.gnu.org/gnu/m4/m4-1.4.16.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f m4-1.4.16.tar.gz
	rm -rf m4-1.4.16

