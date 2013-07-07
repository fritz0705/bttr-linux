.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=2.14
FETCH?=curl

CONFIGURE_FLAGS = 
ifneq ($(WITH_PCRE),yes)
	CONFIGURE_FLAGS += --disable-perl-regexp
endif

all: build

fetch: grep-$(VERSION).tar.xz
unpack: grep-$(VERSION)/
patch: unpack
prepare: grep-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../grep-$(VERSION)/configure --prefix=$(PREFIX) $(CONFIGURE_FLAGS)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r grep-$(VERSION)/

distclean: clean
	$(RM) grep-$(VERSION).tar.xz

grep-$(VERSION).tar.xz:
	$(FETCH) ftp://ftp.gnu.org/gnu/grep/grep-$(VERSION).tar.xz > $@

grep-$(VERSION)/: grep-$(VERSION).tar.xz
	tar xJf $<

