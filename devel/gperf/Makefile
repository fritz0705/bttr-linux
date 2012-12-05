PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../gperf-3.0.4/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: gperf-3.0.4.tar.gz
	tar xzf gperf-3.0.4.tar.gz
	mkdir -p build
	touch prepare

gperf-3.0.4.tar.gz:
	wget ftp://ftp.gnu.org/gnu/gperf/gperf-3.0.4.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f gperf-3.0.4.tar.gz
	rm -rf gperf-3.0.4

