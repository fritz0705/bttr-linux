.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

LIBDIR=$(PREFIX)/lib

ifeq ($(PREFIX),/)
INCLUDEDIR=/usr/include
else
INCLUDEDIR=$(PREFIX)/include
endif

ifeq ($(PREFIX),/)
MAN3DIR=/usr/man/man3
else
MAN3DIR=$(PREFIX)/man/man3
endif

all: build

build: configure
	$(MAKE) -C libowfat-0.29/

configure: prepare

prepare: libowfat-0.29.tar.bz2
	tar xjf libowfat-0.29.tar.bz2
	@mkdir build
	@touch prepare

libowfat-0.29.tar.bz2:
	wget http://dl.fefe.de/libowfat-0.29.tar.bz2

install: build
	$(MAKE) -C libowfat-0.29/ install \
		LIBDIR=$(DESTDIR)/$(LIBDIR) \
		INCLUDEDIR=$(DESTDIR)/$(INCLUDEDIR) \
		MAN3DIR=$(DESTDIR)/$(MAN3DIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libowfat-0.29.tar.gz
	$(RM) -r libowfat-0.29/

