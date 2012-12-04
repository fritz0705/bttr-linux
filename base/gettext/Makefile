PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../gettext-0.18.1.1/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: gettext-0.18.1.1.tar.gz
	tar xzf gettext-0.18.1.1.tar.gz
	sed -i -e '/gets is a/d' gettext-0.18.1.1/gettext-runtime/gnulib-lib/stdio.in.h
	sed -i -e '/gets is a/d' gettext-0.18.1.1/gettext-tools/libgettextpo/stdio.in.h
	sed -i -e '/gets is a/d' gettext-0.18.1.1/gettext-tools/gnulib-lib/stdio.in.h
	mkdir -p build
	touch prepare

gettext-0.18.1.1.tar.gz:
	wget ftp://ftp.gnu.org/gnu/gettext/gettext-0.18.1.1.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f gettext-0.18.1.1.tar.gz
	rm -rf gettext-0.18.1.1

