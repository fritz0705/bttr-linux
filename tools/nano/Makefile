.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../nano-2.3.1/configure --prefix=$(PREFIX)
	@touch configure

prepare: nano-2.3.1.tar.gz
	tar xzf nano-2.3.1.tar.gz
	@mkdir build
	@touch prepare

nano-2.3.1.tar.gz:
	wget ftp://ftp.gnu.org/gnu/nano/nano-2.3.1.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) nano-2.3.1.tar.gz
	$(RM) -r build/
	$(RM) -r nano-2.3.1/

