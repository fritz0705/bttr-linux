PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../curl-7.28.1/configure --prefix=$(PREFIX) \
		--disable-ldap \
		--disable-ldaps \
		--enable-ipv6 \
		--enable-manual \
		--enable-versioned-symbols \
		--enable-threaded-resolver \
		--with-random=/dev/urandom \
		--without-librtmp
	$(MAKE) -C build

prepare: curl-7.28.1.tar.gz
	tar xzf curl-7.28.1.tar.gz
	mkdir -p build
	touch prepare

curl-7.28.1.tar.gz:
	wget http://curl.haxx.se/download/curl-7.28.1.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f curl-7.28.1.tar.gz
	rm -rf curl-7.28.1

