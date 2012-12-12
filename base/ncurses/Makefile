.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build all

configure: prepare
	cd build && ../ncurses-5.9/configure --prefix=$(PREFIX) \
		--with-termlib \
		--with-normal \
		--with-shared
	@touch configure

prepare: ncurses-5.9.tar.gz
	tar xaf ncurses-5.9.tar.gz
	@mkdir build
	@touch prepare

ncurses-5.9.tar.gz:
	wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz

install: build
	$(MAKE) -C build DESTDIR=$(DESTDIR) install

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) ncurses-5.9.tar.gz
	$(RM) -r build/
	$(RM) -r ncurses-5.9/

