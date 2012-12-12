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
	$(RM) prepare
	$(RM) configure
	$(RM) psmisc-22.20.tar.gz
	$(RM) -r build/
	$(RM) -r psmisc-22.20/

