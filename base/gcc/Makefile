.PHONY: all build install clean

PREFIX=/usr
DESTDIR=
LANGUAGES=c,c++

all: build

build: configure
	$(MAKE) -C build all

configure: prepare
	cd build && ../gcc-4.7.2/configure --prefix=$(PREFIX) \
		--enable-languages=$(LANGUAGES) --disable-multilib
	@touch configure

prepare: gcc-4.7.2.tar.gz
	tar xzf gcc-4.7.2.tar.gz
	@mkdir build
	@touch prepare

gcc-4.7.2.tar.gz:
	wget ftp://ftp.gnu.org/gnu/gcc/gcc-4.7.2/gcc-4.7.2.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)
	ln -sf gcc $(DESTDIR)/$(PREFIX)/bin/cc

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) gcc-4.7.2.tar.gz
	$(RM) -r build/
	$(RM) -r gcc-4.7.2/

