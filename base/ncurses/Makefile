PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../ncurses-5.9/configure --prefix=$(PREFIX) \
		--enable-widec \
		--with-normal \
		--with-shared
	$(MAKE) -C build all

prepare: ncurses-5.9.tar.gz
	tar xaf ncurses-5.9.tar.gz
	mkdir -p build
	touch prepare

ncurses-5.9.tar.gz:
	wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz

install: all
	$(MAKE) -C build DESTDIR=$(DESTDIR) install

clean:
	rm -rf build/
	rm -f ncurses-5.9.tar.gz
	rm -rf ncurses-5.9/
	rm -f prepare

