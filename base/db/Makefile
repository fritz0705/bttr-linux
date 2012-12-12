.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build LIBSO_LIBS=-lpthread

configure: prepare
	cd build && ../db-5.3.21/dist/configure --prefix=$(PREFIX) \
		--enable-compat185 \
		--enable-shared \
		--enable-static \
		--enable-cxx \
		--enable-dbm
	@touch configure

prepare: db-5.3.21.tar.gz
	tar xzf db-5.3.21.tar.gz
	@mkdir build
	@touch prepare

db-5.3.21.tar.gz:
	wget http://download.oracle.com/berkeley-db/db-5.3.21.tar.gz

install: build
	yes | $(MAKE) -C build install DESTDIR=$(DESTDIR)
	$(RM) -r $(DESTDIR)/$(PREFIX)/docs

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) db-5.3.21.tar.gz
	$(RM) -r build/
	$(RM) -r db-5.3.21/

