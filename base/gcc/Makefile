.PHONY: all build install clean

PREFIX=/usr
DESTDIR=
LANGUAGES=c
VERSION=4.7.1

# Build configure flags
override __configure_flags =

# You can set an alternative sysroot for this GCC compilation using SYSROOT
ifdef SYSROOT
override __configure_flags += --with-sysroot=$(SYSROOT)
endif

# Set NATIVE_SYSTEM_HEADER_DIR to isolate the GCC from /usr/include
# This is useful while bootstrapping your Linux system
ifdef NATIVE_SYSTEM_HEADER_DIR
override __configure_flags += --with-native-system-header-dir=$(NATIVE_SYSTEM_HEADER_DIR)
endif

# Disable shared libraries and enable static linking for binaries
# Also useful for cross-compilation and bootstrapping a system
ifeq ($(WITHOUT_SHARED),yes)
override __configure_flags += --disable-shared --enable-static
endif

# Remove dependency on libc headers from GCC, to bootstrap a build environment
ifeq ($(WITHOUT_HEADERS),yes)
override __configure_flags += --without-headers
endif

# It should be possible to enable multilib support
ifeq ($(WITH_MULTILIB),yes)
override __configure_flags += --enable-multilib
else
override __configure_flags += --disable-multilib
endif

# We want simple support for several libc versions
ifdef LIBC
ifeq ($(LIBC),glibc)
else ifeq ($(LIBC),eglibc)
else ifeq ($(LIBC),newlib)
override __configure_flags += --with-newlib
else ifeq ($(LIBC),avrlibc)
override __configure_flags += --with-avrlibc
else
$(error libc $(LIBC) is not supported)
endif
endif

# Append CONFIGURE_FLAGS to internal configure flags
# This should be used for more experimental configure flags
override __configure_flags += $(CONFIGURE_FLAGS)

all: build

build: configure
	$(MAKE) -C build all

configure: prepare
	cd build && ../gcc-$(VERSION)/configure --prefix=$(PREFIX) \
		--enable-languages=$(LANGUAGES) \
		$(__configure_flags)
	@touch configure

prepare: gcc-$(VERSION).tar.gz
	tar xzf gcc-$(VERSION).tar.gz
	@mkdir build
	@touch prepare

gcc-$(VERSION).tar.gz:
	wget ftp://ftp.gnu.org/gnu/gcc/gcc-$(VERSION)/gcc-$(VERSION).tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)
	ln -sf gcc $(DESTDIR)/$(PREFIX)/bin/cc

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) gcc-$(VERSION).tar.gz
	$(RM) -r build/
	$(RM) -r gcc-$(VERSION)/

