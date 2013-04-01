.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=5.16.3
FETCH=curl

all: build

fetch: perl-$(VERSION).tar.gz
unpack: perl-$(VERSION)/
patch: unpack
prepare: perl-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd perl-$(VERSION); \
		./Configure -des -Dusethreads -Duseshrplib \
		-Dprefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C perl-$(VERSION)

install: build
	yes | $(MAKE) -C perl-$(VERSION) install

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r perl-$(VERSION)/

distclean: clean
	$(RM) perl-$(VERSION).tar.gz

perl-$(VERSION).tar.gz:
	$(FETCH) http://www.cpan.org/src/5.0/perl-$(VERSION).tar.gz > $@

perl-$(VERSION)/: perl-$(VERSION).tar.gz
	tar xzf $<

