### DEFINITIONS

PREFIX ?= /usr
DESTDIR ?=
FETCH ?= curl
VERSION ?= 0.9.11

override CONFIGURE_ARGV := --prefix=$(PREFIX) $(CONFIGURE_ARGV) $(CONFIGURE_FLAGS)

.PHONY: fetch unpack patch prepare configure build all install clean distclean

### DEFAULT TARGETS

all: build

fetch: musl-$(VERSION).tar.gz
unpack: musl-$(VERSION)
patch: musl-$(VERSION)
prepare:
configure: musl-$(VERSION)/Makefile
build:
install:
clean:
distclean:

### SOURCE FILES

musl-$(VERSION): musl-$(VERSION).tar.gz
	tar xzf $<

musl-$(VERSION).tar.gz:
	$(FETCH) http://www.musl-libc.org/releases/musl-$(VERSION).tar.gz > $@

### CONFIGURATION

musl-$(VERSION)/Makefile: musl-$(VERSION)
	cd musl-$(VERSION) && ./configure $(CONFIGURE_ARGV)

### BUILD

build: musl-$(VERSION)/Makefile
	$(MAKE) -C musl-$(VERSION)/

### INSTALL

install: build
	$(MAKE) -C musl-$(VERSION)/ install

### CLEAN

clean:
	$(RM) -r musl-$(VERSION)

distclean: clean
	$(RM) musl-$(VERSION).tar.gz

