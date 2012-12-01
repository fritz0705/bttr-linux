PREFIX=/usr
DESTDIR=
LANGUAGES=c,c++

all: prepare
	cd build && ../gcc-4.7.2/configure --prefix=$(PREFIX) \
		--enable-languages=$(LANGUAGES)
	$(MAKE) -C build all-gcc

prepare: gcc-4.7.2.tar.gz
	tar xzf gcc-4.7.2.tar.gz
	mkdir build
	touch prepare

gcc-4.7.2.tar.gz:
	wget ftp://ftp.gnu.org/gnu/gcc/gcc-4.7.2/gcc-4.7.2.tar.gz

install: all
	$(MAKE) -C build install-gcc DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f gcc-4.7.2.tar.gz
	rm -rf gcc-4.7.2
	rm -f prepare

