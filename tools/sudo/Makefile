PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../sudo-1.8.6p3/configure --prefix=$(PREFIX) \
		--with-logfac=auth --with-pam --with-env-editor \
		--with-passprompt="[sudo] password for %p: " \
		--with-all-insults
	$(MAKE) -C build

prepare: sudo-1.8.6p3.tar.gz
	tar xzf sudo-1.8.6p3.tar.gz
	mkdir -p build
	touch prepare

sudo-1.8.6p3.tar.gz:
	wget http://www.sudo.ws/sudo/dist/sudo-1.8.6p3.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf sudo-1.8.6p3
	rm -f sudo-1.8.6p3.tar.gz

