.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../xz-5.0.4/configure --prefix=$(PREFIX)
	@touch configure

prepare: xz-5.0.4.tar.gz
	tar xzf xz-5.0.4.tar.gz
	@mkdir build
	@touch prepare

xz-5.0.4.tar.gz:
	wget http://tukaani.org/xz/xz-5.0.4.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) xz-5.0.4.tar.gz
	$(RM) -r build/
	$(RM) -r xz-5.0.4/

