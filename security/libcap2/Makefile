.PHONY: all fetch unpack patch prepare configure build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=2.22
FETCH?=curl -L --retry 3

ifeq ($(shell id -u),0)
	RAISE_SETFCAP=yes
else
	RAISE_SETFCAP=no
endif

all: build

fetch: libcap2_$(VERSION).orig.tar.gz
unpack: libcap-$(VERSION)/
patch: unpack
prepare: libcap-$(VERSION)/
configure: prepare

build: configure
	$(MAKE) -C libcap-$(VERSION)/ all

install: build
	$(MAKE) -C libcap-$(VERSION)/ install DESTDIR=$(DESTDIR) RAISE_SETFCAP=$(RAISE_SETFCAP) prefix=$(PREFIX) lib=lib/

clean:
	$(RM) -r build/
	$(RM) -r libcap-$(VERSION)

distclean: clean
	$(RM) libcap2_$(VERSION).orig.tar.gz

# We should steal this from debian because kernel.org fails
libcap2_$(VERSION).orig.tar.gz:
	$(FETCH) ftp://ftp.de.debian.org/debian/pool/main/libc/libcap2/libcap2_$(VERSION).orig.tar.gz > $@

libcap-$(VERSION)/: libcap2_$(VERSION).orig.tar.gz
	tar xzf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

