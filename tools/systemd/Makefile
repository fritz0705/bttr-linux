.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=208
FETCH?=curl -L --retry 3

override CONFIGURE_FLAGS := --prefix=$(PREFIX) --disable-python-devel \
	--without-python $(CONFIGURE_FLAGS)

all: build

fetch: systemd-$(VERSION).tar.xz
unpack: | systemd-$(VERSION)/
patch: unpack
prepare: | systemd-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../systemd-$(VERSION)/configure $(CONFIGURE_FLAGS)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) -r build/
	$(RM) configure prepare
	$(RM) -r systemd-$(VERSION)/

distclean: clean
	$(RM) systemd-$(VERSION).tar.gz

systemd-$(VERSION)/: systemd-$(VERSION).tar.xz
	tar xJf $<

systemd-$(VERSION).tar.xz:
	$(FETCH) http://www.freedesktop.org/software/systemd/systemd-$(VERSION).tar.xz > $@


.PHONY: Version
Version:
	@echo $(VERSION) > $@

