.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../Linux-PAM-1.1.6/configure --prefix=$(PREFIX)
	@touch configure

prepare: Linux-PAM-1.1.6.tar.gz
	tar xzf Linux-PAM-1.1.6.tar.gz
	@mkdir build
	@touch prepare

Linux-PAM-1.1.6.tar.gz:
	wget http://linux-pam.org/library/Linux-PAM-1.1.6.tar.gz

install: build
	mkdir -p $(DESTDIR)/etc/security
	sed -i -e 's/mkdir -p $$(namespaceddir)/mkdir -p $$(DESTDIR)$$(namespaceddir)/' build/modules/pam_namespace/Makefile
	$(MAKE) -C build install DESTDIR=$(DESTDIR) SCONFIGDIR=/etc/security

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) Linux-PAM-1.1.6.tar.gz
	$(RM) -r build/
	$(RM) -r Linux-PAM-1.1.6/

