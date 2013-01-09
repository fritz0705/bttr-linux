.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C dhcpcd-5.6.6/

configure: prepare
	cd dhcpcd-5.6.6/ && ./configure --prefix=$(PREFIX)
	@touch configure

prepare: dhcpcd-5.6.6.tar.bz2
	tar xjf dhcpcd-5.6.6.tar.bz2
	@mkdir build
	@touch prepare

dhcpcd-5.6.6.tar.bz2:
	curl http://roy.marples.name/downloads/dhcpcd/dhcpcd-5.6.6.tar.bz2 > $@

install: build
	$(MAKE) -C dhcpcd-5.6.6/ install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) dhcpcd-5.6.6.tar.bz2
	$(RM) -r build/
	$(RM) -r dhcpcd-5.6.6/

