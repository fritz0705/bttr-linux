.PHONY: all build install clean

PREFIX=/usr
DESTDIR=
LANGUAGES=c
VERSION=4.7.1

all: build

build: configure
	$(MAKE) -C build all

configure: prepare
	cd build && ../gcc-$(VERSION)/configure --prefix=$(PREFIX) \
		--enable-languages=$(LANGUAGES) --disable-multilib \
		$(CONFIGURE_FLAGS)
	@touch configure

prepare: gcc-$(VERSION).tar.gz
	tar xzf gcc-$(VERSION).tar.gz
	@mkdir build
	@touch prepare

gcc-$(VERSION).tar.gz:
	wget ftp://ftp.gnu.org/gnu/gcc/gcc-$(VERSION)/gcc-$(VERSION).tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)
	ln -sf gcc $(DESTDIR)/$(PREFIX)/bin/cc

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) gcc-$(VERSION).tar.gz
	$(RM) -r build/
	$(RM) -r gcc-$(VERSION)/

