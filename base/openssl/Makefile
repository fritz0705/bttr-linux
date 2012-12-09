.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

mach=$(shell uname -m)

ifeq ($(mach),x86_64)
	openssl_target="linux-x86_64"
else
	openssl_target="linux-elf"
endif

all: build

build: configure
	$(MAKE) -C openssl-1.0.1c -j 1 depend
	$(MAKE) -C openssl-1.0.1c -j 1

configure: prepare
	cd openssl-1.0.1c && ./Configure --prefix=$(PREFIX) shared zlib enable-md2 $(openssl_target)
	@touch configure

prepare: openssl-1.0.1c.tar.gz
	tar xzf openssl-1.0.1c.tar.gz
	@mkdir build
	@touch prepare

openssl-1.0.1c.tar.gz:
	# --no-check-certificate is important
	wget --no-check-certificate https://www.openssl.org/source/openssl-1.0.1c.tar.gz

install: build
	$(MAKE) -C openssl-1.0.1c install INSTALL_PREFIX=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm openssl-1.0.1c.tar.gz
	-rm -r build/
	-rm -r openssl-1.0.1c/

