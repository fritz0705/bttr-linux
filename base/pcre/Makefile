.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../pcre-8.32/configure --prefix=$(PREFIX) \
		--enable-pcre16 --enable-pcre32 --enable-jit \
		--enable-utf --enable-unicode-properties
	@touch configure

prepare: pcre-8.32.tar.gz
	tar xzf pcre-8.32.tar.gz
	@mkdir build
	@touch prepare

pcre-8.32.tar.gz:
	wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.32.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) pcre-8.32.tar.gz
	$(RM) -r build/
	$(RM) -r pcre-8.32/

