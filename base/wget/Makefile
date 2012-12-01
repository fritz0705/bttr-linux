PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../wget-1.14/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: wget-1.14.tar.gz
	tar xzf wget-1.14.tar.gz
	mkdir -p build
	touch prepare

wget-1.14.tar.gz:
	wget ftp://ftp.gnu.org/gnu/wget/wget-1.14.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf wget-1.14
	rm -f wget-1.14.tar.gz

