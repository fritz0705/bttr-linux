.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../intltool-0.50.2/configure --prefix=$(PREFIX)
	@touch configure

prepare: intltool-0.50.2.tar.gz
	tar xzf intltool-0.50.2.tar.gz
	@mkdir build
	@touch prepare

intltool-0.50.2.tar.gz:
	wget --no-check-certificate http://edge.launchpad.net/intltool/trunk/0.50.2/+download/intltool-0.50.2.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) intltool-0.50.2.tar.gz
	$(RM) -r build/
	$(RM) -r intltool-0.50.2/

