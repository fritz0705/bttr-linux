.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../cracklib-2.8.19/configure --prefix=$(PREFIX) \
		--without-python
	@touch configure

prepare: cracklib-2.8.19.tar.gz
	tar xzf cracklib-2.8.19.tar.gz
	@mkdir build
	@touch prepare

cracklib-2.8.19.tar.gz:
	wget http://downloads.sourceforge.net/sourceforge/cracklib/cracklib-2.8.19.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) cracklib-2.8.19.tar.gz
	$(RM) -r build/
	$(RM) -r cracklib-2.8.19/

