.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../bison-2.6.5/configure --prefix=$(PREFIX)
	@touch configure

prepare: bison-2.6.5.tar.gz
	tar xzf bison-2.6.5.tar.gz
	@mkdir build
	@touch prepare

bison-2.6.5.tar.gz:
	wget ftp://ftp.gnu.org/gnu/bison/bison-2.6.5.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) bison-2.6.5.tar.gz
	$(RM) -r build/
	$(RM) -r bison-2.6.5/

