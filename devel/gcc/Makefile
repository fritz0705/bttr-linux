.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
LANGUAGES?=c
VERSION?=4.8.1
FETCH?=curl -L --retry 3

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

# Disable flags for several libraries and features:
#   WITHOUT_DECIMAL_FLOAT   translates to --disable-decimal-float, which
#                           disables the GCC extension to handle decimal floats
#   WITHOUT_LIBMUDFLAP      disable compilation of libmudflap
#   WITHOUT_LIBSSP          disable compilation of libssp
#   WITHOUT_LIBGOMP         disable compilation of libgomp
#   WITHOUT_LIBQUADMATH     disable compilation of libquadmath
ifeq ($(WITHOUT_DECIMAL_FLOAT),yes)
override __configure_flags += --without-decimal-float
endif
ifeq ($(WITHOUT_LIBMUDFLAP),yes)
override __configure_flags += --without-libmudflap
endif
ifeq ($(WITHOUT_LIBSSP),yes)
override __configure_flags += --without-libssp
endif
ifeq ($(WITHOUT_LIBGOMP),yes)
override __configure_flags += --without-libgomp
endif
ifeq ($(WITHOUT_LIBQUADMATH),yes)
override __configure_flags += --without-libquadmath
endif

# Append CONFIGURE_FLAGS to internal configure flags
# This should be used for more experimental configure flags
override __configure_flags += $(CONFIGURE_FLAGS)

all: build

fetch: gcc-$(VERSION).tar.gz
unpack: | gcc-$(VERSION)/
patch: unpack
prepare: | gcc-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../gcc-$(VERSION)/configure --prefix=$(PREFIX) \
		--enable-languages=$(LANGUAGES) \
		$(__configure_flags)
	@touch $@

build: | configure
	$(MAKE) -C build all

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)
ifneq ($(WITHOUT_CC_LINK),yes)
	ln -sf gcc $(DESTDIR)/$(PREFIX)/bin/cc
endif

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r gcc-$(VERSION)/

distclean: clean
	$(RM) gcc-$(VERSION).tar.gz

gcc-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/gcc/gcc-$(VERSION)/gcc-$(VERSION).tar.gz > $@

gcc-$(VERSION)/: gcc-$(VERSION).tar.gz
	tar xzf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

