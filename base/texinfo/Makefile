PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../texinfo-4.9/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: texinfo-4.9.tar.gz
	tar xzf texinfo-4.9.tar.gz
	mkdir -p build
	touch prepare

texinfo-4.9.tar.gz:
	wget ftp://ftp.gnu.org/gnu/texinfo/texinfo-4.9.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f texinfo-4.9.tar.gz
	rm -rf texinfo-4.9

