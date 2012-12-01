PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../bash-4.2/configure --prefix=$(PREFIX)
	$(MAKE) -C build all

prepare: bash-4.2.tar.gz
	tar xzf bash-4.2.tar.gz
	mkdir -p build
	touch prepare

bash-4.2.tar.gz:
	wget ftp://ftp.gnu.org/gnu/bash/bash-4.2.tar.gz

install: all
	$(MAKE) -C build DESTDIR=$(DESTDIR) install

clean:
	rm -rf build/
	rm -f bash-4.2.tar.gz
	rm -rf bash-4.2/
	rm -f prepare

