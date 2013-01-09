.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

override __configure_flags = 

ifdef LIB_PATH
override __configure_flags += --with-lib-path=$(LIB_PATH)
endif

ifdef SYSROOT
override __configure_flags += --with-sysroot=$(SYSROOT)
endif

ifeq ($(WITHOUT_SHARED),yes)
override __configure_flags += --disable-shared --enable-static
endif

override __configure_flags += $(CONFIGURE_FLAGS)

all: build

build: configure
	$(MAKE) -C build all

configure: prepare
	cd build && ../binutils-2.23/configure --prefix=$(PREFIX) \
		$(__configure_flags)
	@touch configure

prepare: binutils-2.23.tar.gz
	tar xzf binutils-2.23.tar.gz
	@mkdir build
	@touch prepare

binutils-2.23.tar.gz:
	wget ftp://ftp.gnu.org/gnu/binutils/binutils-2.23.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) binutils-2.23.tar.gz
	$(RM) -r build/
	$(RM) -r binutils-2.23/

