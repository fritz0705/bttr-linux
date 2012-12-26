.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C XML-Parser-2.41

configure: prepare
	cd XML-Parser-2.41; \
		perl Makefile.PL INSTALLDIRS=vendor
	@touch configure

prepare: XML-Parser-2.41.tar.gz
	tar xzf XML-Parser-2.41.tar.gz
	@mkdir build
	@touch prepare

XML-Parser-2.41.tar.gz:
	wget http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/XML-Parser-2.41.tar.gz

install: build
	$(MAKE) -C XML-Parser-2.41 install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) XML-Parser-2.41.tar.gz
	$(RM) -r build/
	$(RM) -r XML-Parser-2.41/

