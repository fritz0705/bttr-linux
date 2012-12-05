PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../systemd-196/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: systemd-196.tar.xz
	tar xJf systemd-196.tar.xz
	mkdir -p build
	touch prepare

systemd-196.tar.xz:
	wget http://www.freedesktop.org/software/systemd/systemd-196.tar.xz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f systemd-196.tar.xz
	rm -rf systemd-196

