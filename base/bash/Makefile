.PHONY: all build install clean

PREFIX=/usr
DESTDIR=
ifeq ($(PREFIX),/usr)
	BINDIR=/bin
else
	BINDIR=$(PREFIX)/bin
endif

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
	$(RM) prepare
	$(RM) configure
	$(RM) bash-4.2.tar.gz
	$(RM) -r build/
	$(RM) -r bash-4.2/

