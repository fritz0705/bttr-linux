PREFIX=/usr
DESTDIR=

all: prepare
	$(MAKE) -C libcap-2.22/ all

prepare: libcap2_2.22.orig.tar.gz
	tar xzf libcap2_2.22.orig.tar.gz
	mkdir -p build
	touch prepare

# We should steal this from debian because kernel.org fails
libcap2_2.22.orig.tar.gz:
	wget ftp://ftp.de.debian.org/debian/pool/main/libc/libcap2/libcap2_2.22.orig.tar.gz

install: all
	$(MAKE) -C libcap-2.22/ install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf libcap-2.22
	rm -f libcap2_2.22.orig.tar.gz

