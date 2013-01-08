.PHONY: all build install clean

PREFIX=/usr
BINDIR=$(PREFIX)/bin
DESTDIR=

VERSION=0.13

override __targets = gatling

ifneq ($(WITHOUT_DL),yes)
override __targets += dl
endif

ifneq ($(WITHOUT_GETLINKS),yes)
override __targets += getlinks
endif

ifeq ($(WITH_TLS),yes)
override __targets += tlsgatling
endif

ifeq ($(WITH_POLARSSL),yes)
override __targets += ptlsgatling
endif

ifdef LIBOWFAT_PATH
override __targets += libowfat_path="$(LIBOWFAT_PATH)/lib/ $(LIBOWFAT_PATH)/include/"
endif

all: build

build: configure
	$(MAKE) -C gatling-$(VERSION)/ $(__targets)

configure: prepare
ifdef FEATURE_CONFIG
	cp -f $(FEATURE_CONFIG) gatling-$(VERSION)/gatling_features.h
endif
	@touch configure

prepare: gatling-$(VERSION).tar.bz2
	tar xjf gatling-$(VERSION).tar.bz2
	@mkdir build
	@touch prepare

gatling-$(VERSION).tar.bz2:
	curl http://dl.fefe.de/gatling-$(VERSION).tar.bz2 > $@

install: build
	install -d $(DESTDIR)/$(BINDIR)
	install gatling-$(VERSION)/gatling $(DESTDIR)/$(BINDIR)
ifneq ($(WITHOUT_DL),yes)
	install gatling-$(VERSION)/dl $(DESTDIR)/$(BINDIR)
endif
ifneq ($(WITHOUT_GETLINKS),yes)
	install gatling-$(VERSION)/getlinks $(DESTDIR)/$(BINDIR)
endif
ifeq ($(WITH_TLS),yes)
	install gatling-$(VERSION)/tlsgatling $(DESTDIR)/$(BINDIR)
endif
ifeq ($(WITH_POLARSSL),yes)
	install gatling-$(VERSION)/ptlsgatling $(DESTDIR)/$(BINDIR)
endif

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) gatling-$(VERSION).tar.bz2
	$(RM) -r gatling-$(VERSION)/

