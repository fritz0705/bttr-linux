.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../autoconf-2.69/configure --prefix=$(PREFIX)
	@touch configure

prepare: autoconf-2.69.tar.gz
	tar xzf autoconf-2.69.tar.gz
	@mkdir build
	@touch prepare

autoconf-2.69.tar.gz:
	wget ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) autoconf-2.69.tar.gz
	$(RM) -r build/
	$(RM) -r autoconf-2.69/

