.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

configure_flags =

ifeq ($(HAVE_NO_GLIB),yes)
	configure_flags += --with-internal-glib
endif

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../pkg-config-0.27.1/configure --prefix=$(PREFIX) $(configure_flags)
	@touch configure

prepare: pkg-config-0.27.1.tar.gz
	tar xzf pkg-config-0.27.1.tar.gz
	@mkdir build
	@touch prepare

pkg-config-0.27.1.tar.gz:
	wget http://pkgconfig.freedesktop.org/releases/pkg-config-0.27.1.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)
	ln -sf /usr/lib/pkgconfig $(DESTDIR)/lib/pkgconfig

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) pkg-config-0.27.1.tar.gz
	$(RM) -r build/
	$(RM) -r pkg-config-0.27.1/

