PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../nano-2.3.1/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: nano-2.3.1.tar.gz
	tar xzf nano-2.3.1.tar.gz
	mkdir -p build
	touch prepare

nano-2.3.1.tar.gz:
	wget ftp://ftp.gnu.org/gnu/nano/nano-2.3.1.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf nano-2.3.1
	rm -f nano-2.3.1.tar.gz

