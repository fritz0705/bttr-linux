.PHONY: all build install clean

ZONEINFO=/usr/share/zoneinfo
DESTDIR=

TIMEZONES = africa antarctica asia australasia europe northamerica southamerica pacificnew etcetera backward systemv factory solar87 solar88 solar89

all: build

build: configure

configure: prepare
	@touch configure

prepare: tzdata2012j.tar.gz
	@mkdir build
	cd build && tar xzf ../tzdata2012j.tar.gz
	@touch prepare

tzdata2012j.tar.gz:
	wget http://www.iana.org/time-zones/repository/releases/tzdata2012j.tar.gz

install: build
	install -dm755 $(DESTDIR)/$(ZONEINFO)
	cd build; \
		zic -y ./yearistype -d $(DESTDIR)/$(ZONEINFO) $(TIMEZONES); \
		zic -y ./yearistype -d $(DESTDIR)/$(ZONEINFO)/posix $(TIMEZONES); \
		zic -y ./yearistype -d $(DESTDIR)/$(ZONEINFO)/right -L leapseconds $(TIMEZONES); \
		zic -y ./yearistype -d $(DESTDIR)/$(ZONEINFO) -p America/New_York; \
		cp -v zone.tab iso3166.tab $(DESTDIR)/$(ZONEINFO)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) tzdata2012j.tar.gz
	$(RM) -r build/
