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
	$(RM) prepare
	$(RM) configure
	$(RM) perl-5.16.2.tar.gz
	$(RM) -r build/
	$(RM) -r perl-5.16.2/

