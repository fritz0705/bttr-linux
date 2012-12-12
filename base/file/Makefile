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
	$(RM) prepare
	$(RM) configure
	$(RM) file-5.11.tar.gz
	$(RM) -r build/
	$(RM) -r file-5.11/

