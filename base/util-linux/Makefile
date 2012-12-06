PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../util-linux-2.22/configure --prefix=$(PREFIX) \
		--enable-fs-paths-extra=/usr/bin:/usr/sbin \
		--enable-raw \
		--enable-vipw \
		--enable-newgrp \
		--enable-chfn-chsh \
		--enable-write \
		--enable-mesg \
		--enable-socket-activation
	# XXX Horrible fix to build util-linux into a package without root
	sed -i -e 's/\tchgrp/\t-chgrp/' build/Makefile
	$(MAKE) -C build

prepare: util-linux-2.22.tar.gz
	tar xzf util-linux-2.22.tar.gz
	mkdir -p build
	touch prepare

util-linux-2.22.tar.gz:
	wget ftp://ftp.kernel.org/pub/linux/utils/util-linux/v2.22/util-linux-2.22.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f util-linux-2.22.tar.gz
	rm -rf util-linux-2.22

