PREFIX=/usr
EXECPREFIX=
DESTDIR=

all: prepare
	cd procps-procps && ./autogen.sh
	cd build && ../procps-procps/configure --prefix=$(PREFIX) --exec-prefix=$(EXECPREFIX)
	$(MAKE) -C build

prepare: procps-ng-3.3.5.tar.gz
	tar xzf procps-ng-3.3.5.tar.gz
	mkdir -p build
	touch prepare

procps-ng-3.3.5.tar.gz:
	wget -O $@ http://gitorious.org/procps/procps/archive-tarball/v3.3.5

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf procps-procps
	rm -f procps-ng-3.3.5.tar.gz

