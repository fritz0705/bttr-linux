.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C perl-5.16.2

configure: prepare
	cd perl-5.16.2; \
		./Configure -des -Dusethreads -Duseshrplib \
		-Dprefix=$(PREFIX)
	@touch configure

prepare: perl-5.16.2.tar.gz
	tar xzf perl-5.16.2.tar.gz
	@mkdir build
	@touch prepare

perl-5.16.2.tar.gz:
	wget http://www.cpan.org/src/5.0/perl-5.16.2.tar.gz

install: build
	yes | $(MAKE) -C perl-5.16.2 install

clean:
	-rm prepare
	-rm configure
	-rm perl-5.16.2.tar.gz
	-rm -r build/
	-rm -r perl-5.16.2/

