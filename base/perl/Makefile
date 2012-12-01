PREFIX=/usr
DESTDIR=

all: prepare
	cd perl-5.16.2; \
		./Configure -des -Dusethreads -Duseshrplib \
		-Dprefix=$(PREFIX)
	$(MAKE) -C perl-5.16.2

prepare: perl-5.16.2.tar.gz
	tar xzf perl-5.16.2.tar.gz
	touch prepare

perl-5.16.2.tar.gz:
	wget http://www.cpan.org/src/5.0/perl-5.16.2.tar.gz

install: all
	yes | $(MAKE) -C perl-5.16.2 install

clean:
	rm -f prepare
	rm -f perl-5.16.2.tar.gz
	rm -rf perl-5.16.2

