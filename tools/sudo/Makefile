.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../sudo-1.8.6p3/configure --prefix=$(PREFIX) \
		--with-logfac=auth --with-pam --with-env-editor \
		--with-passprompt="[sudo] password for %p: " \
		--with-all-insults
	@touch configure

prepare: sudo-1.8.6p3.tar.gz
	tar xzf sudo-1.8.6p3.tar.gz
	@mkdir build
	@touch prepare

sudo-1.8.6p3.tar.gz:
	wget http://www.sudo.ws/sudo/dist/sudo-1.8.6p3.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) sudo-1.8.6p3.tar.gz
	$(RM) -r build/
	$(RM) -r sudo-1.8.6p3/

