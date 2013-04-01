.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=5.3.21
FETCH=curl

all: build

fetch: db-$(VERSION).tar.gz
unpack: db-$(VERSION)/
patch: unpack
prepare: db-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../db-$(VERSION)/dist/configure --prefix=$(PREFIX) \
		--enable-compat185 \
		--enable-shared \
		--enable-static \
		--enable-cxx \
		--enable-dbm
	@touch $@

build: configure
	$(MAKE) -C build LIBSO_LIBS=-lpthread

install: build
	yes | $(MAKE) -C build install DESTDIR=$(DESTDIR)
	$(RM) -r $(DESTDIR)/$(PREFIX)/docs

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r db-$(VERSION)/

distclen: clean
	$(RM) db-$(VERSION).tar.gz

db-$(VERSION).tar.gz:
	$(FETCH) http://download.oracle.com/berkeley-db/db-$(VERSION).tar.gz > $@

db-$(VERSION)/: db-$(VERSION).tar.gz
	tar xzf $<

