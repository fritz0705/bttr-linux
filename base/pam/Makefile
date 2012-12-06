PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../Linux-PAM-1.1.6/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: Linux-PAM-1.1.6.tar.gz
	tar xzf Linux-PAM-1.1.6.tar.gz
	mkdir -p build
	touch prepare

Linux-PAM-1.1.6.tar.gz:
	wget http://linux-pam.org/library/Linux-PAM-1.1.6.tar.gz

install: all
	mkdir -p $(DESTDIR)/etc/security
	sed -i -e 's/mkdir -p $$(namespaceddir)/mkdir -p $$(DESTDIR)$$(namespaceddir)/' build/modules/pam_namespace/Makefile
	$(MAKE) -C build install DESTDIR=$(DESTDIR) SCONFIGDIR=/etc/security

clean:
	rm -rf build/
	rm -f prepare
	rm -f Linux-PAM-1.1.6.tar.gz
	rm -rf Linux-PAM-1.1.6

