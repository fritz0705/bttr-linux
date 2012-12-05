PREFIX=/usr
DESTDIR=

all: prepare
	cd XML-Parser-2.41; \
		perl Makefile.PL INSTALLDIRS=vendor; \
		$(MAKE)

prepare: XML-Parser-2.41.tar.gz
	tar xzf XML-Parser-2.41.tar.gz
	mkdir -p build
	touch prepare

XML-Parser-2.41.tar.gz:
	wget http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/XML-Parser-2.41.tar.gz

install: all
	$(MAKE) -C XML-Parser-2.41 install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f XML-Parser-2.41.tar.gz
	rm -rf XML-Parser-2.41

