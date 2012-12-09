.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../file-5.11/configure --prefix=$(PREFIX)
	@touch configure

prepare: file-5.11.tar.gz
	tar xzf file-5.11.tar.gz
	@mkdir build
	@touch prepare

file-5.11.tar.gz:
	wget ftp://ftp.astron.com/pub/file/file-5.11.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm file-5.11.tar.gz
	-rm -r build/
	-rm -r file-5.11/

