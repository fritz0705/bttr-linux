PREFIX=/usr
DESTDIR=
BINDIR=/bin

all: prepare
	cd build && ../bash-4.2/configure --prefix=$(PREFIX) \
		--bindir=$(BINDIR)
	$(MAKE) -C build all

prepare: bash-4.2.tar.gz
	tar xzf bash-4.2.tar.gz
	mkdir -p build
	touch prepare

bash-4.2.tar.gz:
	wget ftp://ftp.gnu.org/gnu/bash/bash-4.2.tar.gz

install: all
	$(MAKE) -C build DESTDIR=$(DESTDIR) install
	ln -sf bash $(DESTDIR)/$(BINDIR)/sh

clean:
	rm -rf build/
	rm -f bash-4.2.tar.gz
	rm -rf bash-4.2/
	rm -f prepare

