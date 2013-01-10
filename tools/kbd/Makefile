.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build KEYCODES_PROGS=yes RESIZECONS_PROGS=yes
	# Build instructions

configure: prepare
	cd build && ../kbd-1.15.3/configure --prefix=$(PREFIX)
	@touch configure

prepare: kbd-1.15.3.tar.gz
	tar xzf kbd-1.15.3.tar.gz
	@mkdir build
	@touch prepare

kbd-1.15.3.tar.gz:
	wget http://www.kbd-project.org/download/kbd-1.15.3.tar.gz

install: build
	$(MAKE) -C build KEYCODES_PROGS=yes RESIZECONS_PROGS=yes install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) kbd-1.15.3.tar.gz
	$(RM) -r build/
	$(RM) -r kbd-1.15.3/
