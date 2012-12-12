.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../gettext-0.18.1.1/configure --prefix=$(PREFIX)
	@touch configure

prepare: gettext-0.18.1.1.tar.gz
	tar xzf gettext-0.18.1.1.tar.gz
	sed -i -e '/gets is a/d' gettext-0.18.1.1/gettext-runtime/gnulib-lib/stdio.in.h
	sed -i -e '/gets is a/d' gettext-0.18.1.1/gettext-tools/libgettextpo/stdio.in.h
	sed -i -e '/gets is a/d' gettext-0.18.1.1/gettext-tools/gnulib-lib/stdio.in.h
	@mkdir build
	@touch prepare

gettext-0.18.1.1.tar.gz:
	wget ftp://ftp.gnu.org/gnu/gettext/gettext-0.18.1.1.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) gettext-0.18.1.1.tar.gz
	$(RM) -r build/
	$(RM) -r gettext-0.18.1.1/

