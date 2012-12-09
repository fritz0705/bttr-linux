.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

ifeq ($(shell id -u),0)
	RAISE_SETFCAP=yes
else
	RAISE_SETFCAP=no
endif

all: build

build: configure
	$(MAKE) -C libcap-2.22/ all

configure: prepare
	tar xzf libcap2_2.22.orig.tar.gz
	@touch configure

prepare: libcap2_2.22.orig.tar.gz
	tar xzf libcap2_2.22.orig.tar.gz
	@mkdir build
	@touch prepare

# We should steal this from debian because kernel.org fails
libcap2_2.22.orig.tar.gz:
	wget ftp://ftp.de.debian.org/debian/pool/main/libc/libcap2/libcap2_2.22.orig.tar.gz

install: build
	$(MAKE) -C libcap-2.22/ install DESTDIR=$(DESTDIR) RAISE_SETFCAP=$(RAISE_SETFCAP)

clean:
	-rm prepare
	-rm configure
	-rm libcap2_2.22.orig.tar.gz
	-rm -r build/
	-rm -r libcap-2.22

