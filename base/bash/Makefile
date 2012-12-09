.PHONY: all build install clean

PREFIX=/usr
DESTDIR=
BINDIR=/bin

all: build

build: configure
	$(MAKE) -C build all

configure: prepare
	cd build && ../bash-4.2/configure --prefix=$(PREFIX) \
		--bindir=$(BINDIR)
	@touch configure

prepare: bash-4.2.tar.gz
	tar xzf bash-4.2.tar.gz
	@mkdir build
	@touch prepare

bash-4.2.tar.gz:
	wget ftp://ftp.gnu.org/gnu/bash/bash-4.2.tar.gz

install: build
	$(MAKE) -C build DESTDIR=$(DESTDIR) install
	ln -sf bash $(DESTDIR)/$(BINDIR)/sh

clean:
	-rm prepare
	-rm configure
	-rm bash-4.2.tar.gz
	-rm -r build/
	-rm -r bash-4.2/

