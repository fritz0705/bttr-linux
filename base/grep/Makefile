.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

CONFIGURE_FLAGS = 
ifneq ($(WITH_PCRE),yes)
	CONFIGURE_FLAGS += --disable-perl-regexp
endif

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../grep-2.14/configure --prefix=$(PREFIX) $(CONFIGURE_FLAGS)
	@touch configure

prepare: grep-2.14.tar.xz
	tar xJf grep-2.14.tar.xz
	@mkdir build
	@touch prepare

grep-2.14.tar.xz:
	wget ftp://ftp.gnu.org/gnu/grep/grep-2.14.tar.xz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) grep-2.14.tar.gz
	$(RM) -r build/
	$(RM) -r grep-2.14/

