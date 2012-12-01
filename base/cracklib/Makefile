PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../cracklib-2.8.19/configure --prefix=$(PREFIX) \
		--without-python
	$(MAKE) -C build

prepare: cracklib-2.8.19.tar.gz
	tar xzf cracklib-2.8.19.tar.gz
	mkdir -p build
	touch prepare

cracklib-2.8.19.tar.gz:
	wget http://downloads.sourceforge.net/sourceforge/cracklib/cracklib-2.8.19.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf cracklib-2.8.19
	rm -f cracklib-2.8.19.tar.gz

