PREFIX=/usr
DESTDIR=

configure_flags =

ifeq ($(HAVE_NO_GLIB),yes)
	configure_flags += --with-internal-glib
endif

all: prepare
	cd build && ../pkg-config-0.27.1/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: pkg-config-0.27.1.tar.gz
	tar xzf pkg-config-0.27.1.tar.gz
	mkdir -p build
	touch prepare

pkg-config-0.27.1.tar.gz:
	wget http://pkgconfig.freedesktop.org/releases/pkg-config-0.27.1.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f pkg-config-0.27.1.tar.gz
	rm -rf pkg-config-0.27.1

