PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../psmisc-22.20/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: psmisc-22.20.tar.gz
	tar xzf psmisc-22.20.tar.gz
	mkdir -p build
	touch prepare

psmisc-22.20.tar.gz:
	wget http://sourceforge.net/projects/psmisc/files/psmisc/psmisc-22.20.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f psmisc-22.20.tar.gz
	rm -rf psmisc-22.20

