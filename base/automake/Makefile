.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../automake-1.12.5/configure --prefix=$(PREFIX)
	@touch configure

prepare: automake-1.12.5.tar.gz
	tar xzf automake-1.12.5.tar.gz
	@mkdir build
	@touch prepare

automake-1.12.5.tar.gz:
	wget ftp://ftp.gnu.org/gnu/automake/automake-1.12.5.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) automake-1.12.5.tar.gz
	$(RM) -r build/
	$(RM) -r automake-1.12.5/

