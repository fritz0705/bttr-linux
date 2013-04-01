.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=1.1.6
FETCH=curl

all: build

fetch: Linux-PAM-$(VERSION).tar.gz
unpack: Linux-PAM-$(VERSION)/
patch: unpack
prepare: Linux-PAM-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../Linux-PAM-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	mkdir -p $(DESTDIR)/etc/security
	sed -i -e 's/mkdir -p $$(namespaceddir)/mkdir -p $$(DESTDIR)$$(namespaceddir)/' build/modules/pam_namespace/Makefile
	$(MAKE) -C build install DESTDIR=$(DESTDIR) SCONFIGDIR=/etc/security

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r Linux-PAM-$(VERSION)/

distclean: clean
	$(RM) Linux-PAM-$(VERSION).tar.gz

Linux-PAM-$(VERSION).tar.gz:
	$(FETCH) http://linux-pam.org/library/Linux-PAM-$(VERSION).tar.gz > $@

Linux-PAM-$(VERSION)/: Linux-PAM-$(VERSION).tar.gz
	tar xzf $<

