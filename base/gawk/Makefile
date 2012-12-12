.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../gawk-4.0.1/configure --prefix=$(PREFIX)
	@touch configure

prepare: gawk-4.0.1.tar.gz
	tar xzf gawk-4.0.1.tar.gz
	@mkdir build
	@touch prepare

gawk-4.0.1.tar.gz:
	wget ftp://ftp.gnu.org/gnu/gawk/gawk-4.0.1.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) gawk-4.0.1.tar.gz
	$(RM) -r build/
	$(RM) -r gawk-4.0.1/

