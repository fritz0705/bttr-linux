PREFIX=/usr
DESTDIR=

all: prepare
	cd libtirpc-0.2.2 && ./configure --prefix=$(PREFIX) \
		--enable-gss
	$(MAKE) -C libtirpc-0.2.2

prepare: libtirpc-0.2.2.tar.bz2
	tar xjf libtirpc-0.2.2.tar.bz2
	cd libtirpc-0.2.2; \
		patch -Np1 -i ../libtirpc-0.2.3rc3.patch; \
		sh autogen.sh \
		autoreconf -fisv
	mkdir -p build
	touch prepare

libtirpc-0.2.2.tar.bz2:
	wget http://downloads.sourceforge.net/sourceforge/libtirpc/libtirpc-0.2.2.tar.bz2

install: all
	$(MAKE) -C libtirpc-0.2.2 install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libtirpc-0.2.2.tar.bz2
	rm -rf libtirpc-0.2.2/

