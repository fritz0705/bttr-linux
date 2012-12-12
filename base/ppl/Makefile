.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../ppl-1.0/configure --prefix=$(PREFIX)
	@touch configure

prepare: ppl-1.0.tar.gz
	tar xzf ppl-1.0.tar.gz
	@mkdir build
	@touch prepare

ppl-1.0.tar.gz:
	wget http://bugseng.com/products/ppl/download/ftp/releases/1.0/ppl-1.0.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) ppl-1.0.tar.gz
	$(RM) -r build/
	$(RM) -r ppl-1.0/

