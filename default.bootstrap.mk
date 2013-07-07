# Base system
PACKAGES += base/acl
PACKAGES += base/attr
PACKAGES += base/autoconf
PACKAGES += base/automake
PACKAGES += base/bash
PACKAGES += base/binutils
PACKAGES += base/bison
PACKAGES += base/bzip2
PACKAGES += base/cloog
PACKAGES += base/coreutils
PACKAGES += base/cracklib
PACKAGES += base/curl
PACKAGES += base/db
PACKAGES += base/diffutils
PACKAGES += base/expat
PACKAGES += base/file
PACKAGES += base/findutils
PACKAGES += base/flex
PACKAGES += base/gawk
PACKAGES += base/gcc
PACKAGES += base/gdbm
PACKAGES += base/gettext
PACKAGES += base/git
PACKAGES += base/glibc
PACKAGES += base/gmp
PACKAGES += base/grep
PACKAGES += base/groff
PACKAGES += base/gzip

PACKAGES += base/iproute2
base_iproute2_FLAGS = VERSION=GIT

PACKAGES += base/iputils
PACKAGES += base/less
PACKAGES += base/libcap2
PACKAGES += base/libgssglue
PACKAGES += base/libidn
PACKAGES += base/libssh2
PACKAGES += base/libtirpc
PACKAGES += base/libtool
PACKAGES += base/lvm2
PACKAGES += base/m4
PACKAGES += base/make
PACKAGES += base/man-pages
PACKAGES += base/mpc
PACKAGES += base/mpfr
PACKAGES += base/ncurses
PACKAGES += base/ncursesw
PACKAGES += base/openssl
PACKAGES += base/pam
PACKAGES += base/patch
PACKAGES += base/pcre
PACKAGES += base/perl

PACKAGES += base/ppl
base_ppl_FLAGS = VERSION=GIT

PACKAGES += base/procps-ng
PACKAGES += base/psmisc
PACKAGES += base/readline
PACKAGES += base/sed
PACKAGES += base/shadow
PACKAGES += base/tar
PACKAGES += base/texinfo
PACKAGES += base/tzdata
PACKAGES += base/util-linux
PACKAGES += base/wget
PACKAGES += base/xz
PACKAGES += base/zlib

# Linux kernel
PACKAGES += kernel/linux
ifndef WITH_KERNEL
kernel_linux_TARGETS = install-headers
else
PACKAGES += kernel/kmod
endif

# Editor
ifeq ($(WITH_EDITOR),vi)
PACKAGES += tools/vi
else ifeq ($(WITH_EDITOR),vim)
PACKAGES += tools/vim
else ifeq ($(WITH_EDITOR),nano)
PACKAGES += tools/nano
endif

# Systemd / eudev
ifeq ($(WITH_UDEV),eudev)
PACKAGES += tools/eudev
else ifeq ($(WITH_UDEV),systemd)
PACKAGES += tools/systemd
endif

ifdef WITH_SYSTEMD
PACKAGES += tools/systemd devel/libgcrypt devel/glib tools/dbus
PACKAGES += kernel/kmod
endif

# Clang
ifdef WITH_CLANG
PACKAGES += devel/clang
endif

