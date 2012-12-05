PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../intltool-0.50.2/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: intltool-0.50.2.tar.gz
	tar xzf intltool-0.50.2.tar.gz
	mkdir -p build
	touch prepare

intltool-0.50.2.tar.gz:
	wget --no-check-certificate http://edge.launchpad.net/intltool/trunk/0.50.2/+download/intltool-0.50.2.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f intltool-0.50.2.tar.gz
	rm -rf intltool-0.50.2

