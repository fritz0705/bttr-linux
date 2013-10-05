.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=2.41
FETCH?=curl -L

all: build

fetch: XML-Parser-$(VERSION).tar.gz
unpack: | XML-Parser-$(VERSION)/
patch: unpack
prepare: | XML-Parser-$(VERSION)/

configure: prepare
	cd XML-Parser-$(VERSION); \
		perl Makefile.PL INSTALLDIRS=vendor
	@touch $@

build: configure
	$(MAKE) -C XML-Parser-$(VERSION)

install: build
	$(MAKE) -C XML-Parser-$(VERSION) install DESTDIR=$(DESTDIR)

clean:
	$(RM) configure
	$(RM) -r XML-Parser-$(VERSION)/

distclean: clean
	$(RM) XML-Parser-$(VERSION).tar.gz

XML-Parser-$(VERSION).tar.gz:
	$(FETCH) http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/XML-Parser-$(VERSION).tar.gz > $@

XML-Parser-$(VERSION)/: XML-Parser-$(VERSION).tar.gz
	tar xzf $<

