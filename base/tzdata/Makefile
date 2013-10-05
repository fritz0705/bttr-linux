.PHONY: all fetch unpack patch prepare configure build install clean distclean

ZONEINFO?=/usr/share/zoneinfo
DESTDIR?=

TIMEZONES = africa antarctica asia australasia europe northamerica southamerica pacificnew etcetera backward systemv factory solar87 solar88 solar89

VERSION?=2013f
FETCH?=curl

all: build

fetch: tzdata$(VERSION).tar
unpack: tzdata$(VERSION)/
patch: unpack
prepare: patch
configure: prepare
build: configure

install: build
	install -dm755 $(DESTDIR)/$(ZONEINFO)
	cd tzdata$(VERSION); \
		zic -y ./yearistype -d $(DESTDIR)/$(ZONEINFO) $(TIMEZONES); \
		zic -y ./yearistype -d $(DESTDIR)/$(ZONEINFO)/posix $(TIMEZONES); \
		zic -y ./yearistype -d $(DESTDIR)/$(ZONEINFO)/right -L leapseconds $(TIMEZONES); \
		zic -y ./yearistype -d $(DESTDIR)/$(ZONEINFO) -p America/New_York; \
		cp -v zone.tab iso3166.tab $(DESTDIR)/$(ZONEINFO)

clean:
	$(RM) -r tzdata$(VERSION)/

distclean: clean
	$(RM) tzdata$(VERSION).tar.gz

tzdata$(VERSION).tar:
	$(FETCH) http://www.iana.org/time-zones/repository/releases/tzdata$(VERSION).tar.gz > $@

tzdata$(VERSION)/: tzdata$(VERSION).tar
	mkdir $@
	cd $@ && tar xf ../$<

