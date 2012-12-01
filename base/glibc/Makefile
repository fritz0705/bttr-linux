PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../glibc-2.16.0/configure --prefix=$(PREFIX) \
		--enable-add-ons=nptl,libidn \
		--enable-obsolete-rpc \
		--enable-kernel=2.6.32 \
		--enable-bind-now --disable-profile \
		--enable-stackguard-randomization \
		--enable-multi-arch
	$(MAKE) -C build all

prepare: glibc-2.16.0.tar.gz
	tar xzf glibc-2.16.0.tar.gz
	mkdir -p build
	touch prepare

glibc-2.16.0.tar.gz:
	wget ftp://ftp.gnu.org/gnu/glibc/glibc-2.16.0.tar.gz

install: all
	$(MAKE) -C build install_root=$(DESTDIR) install

clean:
	rm -rf build/
	rm -f glibc-2.16.0.tar.gz
	rm -rf glibc-2.16.0
	rm -f prepare


