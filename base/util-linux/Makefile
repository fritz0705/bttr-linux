.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../util-linux-2.22/configure --prefix=$(PREFIX) \
		--enable-fs-paths-extra=/usr/bin:/usr/sbin \
		--enable-raw \
		--enable-vipw \
		--enable-newgrp \
		--enable-chfn-chsh \
		--enable-write \
		--enable-mesg \
		--enable-socket-activation
	@touch configure

prepare: util-linux-2.22.tar.gz
	tar xzf util-linux-2.22.tar.gz
	@mkdir build
	@touch prepare

util-linux-2.22.tar.gz:
	wget ftp://ftp.kernel.org/pub/linux/utils/util-linux/v2.22/util-linux-2.22.tar.gz

install: build
	sed -i -e 's/\tchgrp/\t-chgrp/' build/Makefile
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) util-linux-2.22.tar.gz
	$(RM) -r build/
	$(RM) -r util-linux-2.22/

