.PHONY: all build install clean

PREFIX=/usr
ifeq ($(PREFIX),/usr)
	EXECPREFIX=
else
	EXECPREFIX=$(PREFIX)
endif
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd procps-procps && ./autogen.sh
	cd build && ../procps-procps/configure --prefix=$(PREFIX) --exec-prefix=$(EXECPREFIX)
	@touch configure

prepare: procps-ng-3.3.5.tar.gz
	tar xzf procps-ng-3.3.5.tar.gz
	@mkdir build
	@touch prepare

procps-ng-3.3.5.tar.gz:
	wget -O $@ http://gitorious.org/procps/procps/archive-tarball/v3.3.5

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) procps-ng-3.3.5.tar.gz
	$(RM) -r build/
	$(RM) -r procps-ng-3.3.5/

