.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../curl-7.28.1/configure --prefix=$(PREFIX) \
		--disable-ldap \
		--disable-ldaps \
		--enable-ipv6 \
		--enable-manual \
		--enable-versioned-symbols \
		--enable-threaded-resolver \
		--with-random=/dev/urandom \
		--without-librtmp
	@touch configure

prepare: curl-7.28.1.tar.gz
	tar xzf curl-7.28.1.tar.gz
	@mkdir build
	@touch prepare

curl-7.28.1.tar.gz:
	wget http://curl.haxx.se/download/curl-7.28.1.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm curl-7.28.1.tar.gz
	-rm -r build/
	-rm -r curl-7.28.1/

