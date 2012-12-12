.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../m4-1.4.16/configure --prefix=$(PREFIX)
	@touch configure

prepare: m4-1.4.16.tar.gz
	tar xzf m4-1.4.16.tar.gz
	sed -i -e '/gets is a/d' m4-1.4.16/lib/stdio.in.h
	@mkdir build
	@touch prepare

m4-1.4.16.tar.gz:
	wget ftp://ftp.gnu.org/gnu/m4/m4-1.4.16.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) m4-1.4.16.tar.gz
	$(RM) -r build/
	$(RM) -r m4-1.4.16/

