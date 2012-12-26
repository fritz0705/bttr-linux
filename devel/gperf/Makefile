.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../gperf-3.0.4/configure --prefix=$(PREFIX)
	@touch configure

prepare: gperf-3.0.4.tar.gz
	tar xzf gperf-3.0.4.tar.gz
	@mkdir build
	@touch prepare

gperf-3.0.4.tar.gz:
	wget ftp://ftp.gnu.org/gnu/gperf/gperf-3.0.4.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) gperf-3.0.4.tar.gz
	$(RM) -r build/
	$(RM) -r gperf-3.0.4/

