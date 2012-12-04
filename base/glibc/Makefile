# You should not change any directories for this package, it could break your
# system and thus you will need a Live CD (confer Murphy's law)
PREFIX=/usr
DESTDIR=

LIBDIR:=$(PREFIX)/lib
LIBEXECDIR:=$(PREFIX)/lib

all: prepare
	cd build && ../glibc-2.16.0/configure --prefix=$(PREFIX) \
		--libdir=$(LIBDIR) \
		--libexecdir=$(LIBEXECDIR) \
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
	ln -sf lib64 $(DESTDIR)/lib
	# We disable perl installation tests because it's broken and it's not my
	# problem because it's the Glibc! Piss o your lovely Glibc Maintainer
	# Ulrich Drepper if you can.
	$(MAKE) -C build install_root=$(DESTDIR) PERL=no install

clean:
	rm -rf build/
	rm -f glibc-2.16.0.tar.gz
	rm -rf glibc-2.16.0
	rm -f prepare

