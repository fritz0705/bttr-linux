.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../psmisc-22.20/configure --prefix=$(PREFIX)
	@touch configure

prepare: psmisc-22.20.tar.gz
	tar xzf psmisc-22.20.tar.gz
	@mkdir build
	@touch prepare

psmisc-22.20.tar.gz:
	wget http://sourceforge.net/projects/psmisc/files/psmisc/psmisc-22.20.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm psmisc-22.20.tar.gz
	-rm -r build/
	-rm -r psmisc-22.20/

