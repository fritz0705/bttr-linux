.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../sed-4.2.1/configure --prefix=$(PREFIX)
	@touch configure

prepare: sed-4.2.1.tar.gz
	tar xzf sed-4.2.1.tar.gz
	@mkdir build
	@touch prepare

sed-4.2.1.tar.gz:
	wget ftp://ftp.gnu.org/gnu/sed/sed-4.2.1.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) sed-4.2.1.tar.gz
	$(RM) -r build/
	$(RM) -r sed-4.2.1/

