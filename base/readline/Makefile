PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../readline-6.2/configure --prefix=$(PREFIX)
	$(MAKE) -C build all

prepare: readline-6.2.tar.gz
	tar xaf readline-6.2.tar.gz
	mkdir -p build
	touch prepare

readline-6.2.tar.gz:
	wget ftp://ftp.gnu.org/gnu/readline/readline-6.2.tar.gz

install: all
	$(MAKE) -C build DESTDIR=$(DESTDIR) install

clean:
	rm -rf build/
	rm -f readline-6.2.tar.gz
	rm -rf readline-6.2/
	rm -f prepare

