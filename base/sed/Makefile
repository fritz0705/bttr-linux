PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../sed-4.2.1/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: sed-4.2.1.tar.gz
	tar xzf sed-4.2.1.tar.gz
	mkdir -p build
	touch prepare

sed-4.2.1.tar.gz:
	wget ftp://ftp.gnu.org/gnu/sed/sed-4.2.1.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf sed-4.2.1
	rm -f sed-4.2.1.tar.gz

