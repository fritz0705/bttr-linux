PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../pcre-8.32/configure --prefix=$(PREFIX) \
		--enable-pcre16 --enable-pcre32 --enable-jit \
		--enable-utf --enable-unicode-properties
	$(MAKE) -C build

prepare: pcre-8.32.tar.gz
	tar xzf pcre-8.32.tar.gz
	mkdir -p build
	touch prepare

pcre-8.32.tar.gz:
	wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.32.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f pcre-8.32.tar.gz
	rm -rf pcre-8.32

