DESTDIR?=

VERSION?=3.11
FETCH?=curl -L --retry 3

PREFIX?=/
MODDIR?=$(PREFIX)/lib/modules
FIRMWAREDIR?=$(PREFIX)/lib/firmware
BOOTDIR?=$(PREFIX)/boot
ifeq ($(PREFIX),/)
INCLUDEDIR?=$(PREFIX)/usr/include
else
INCLUDEDIR?=$(PREFIX)/include
endif

# Source of kernel configuration
# 
#   defconfig
#     Generate configuration using defconfig target
#
#   procfs
#     Use /proc/config.gz as source
#
#   interactive
#     Call nconfig target
#
#   file
#     Use KCONFIG_FILE as source
#
KCONFIG ?= defconfig

all: build

fetch: linux-$(VERSION).tar.bz2
unpack: linux-$(VERSION)/
patch: unpack
prepare: linux-$(VERSION)/ patch
configure: linux-$(VERSION)/.config

linux-$(VERSION)/.config: linux-$(VERSION)/
ifeq ($(KCONFIG),defconfig)
	$(MAKE) -C linux-$(VERSION) defconfig
else ifeq ($(KCONFIG),procfs)
	zcat /proc/config.gz linux-$(VERSION)/.config
	$(MAKE) -C linux-$(VERSION) silentoldconfig
else ifeq ($(KCONFIG),interactive)
	$(MAKE) -C linux-$(VERSION) nconfig
else ifeq ($(KCONFIG),file)
	cp $(KCONFIG_FILE) linux-$(VERSION)/.config
	$(MAKE) -C linux-$(VERSION) silentoldconfig
else
$(error Invalid value $(KCONFIG) for KCONFIG)
endif

build: configure
	$(MAKE) -C linux-$(VERSION) all
	$(MAKE) -C linux-$(VERSION) headers_install

install-headers: linux-$(VERSION)/
	install -d -m755 $(DESTDIR)/$(INCLUDEDIR)
	$(MAKE) -C linux-$(VERSION) headers_install
	cp -r linux-$(VERSION)/usr/include/. $(DESTDIR)/$(INCLUDEDIR)

install: install-headers build
	install -d -m755 $(DESTDIR)/$(MODDIR)
	install -d -m755 $(DESTDIR)/$(FIRMWAREDIR)
	install -d -m755 $(DESTDIR)/$(BOOTDIR)
	$(MAKE) -C linux-$(VERSION) modules_install INSTALL_MOD_PATH=$(DESTDIR)
	$(MAKE) -C linux-$(VERSION) firmware_install INSTALL_FW_PATH=$(DESTDIR)/$(FIRMWAREDIR)
	install -m 444 linux-$(VERSION)/.config $(DESTDIR)/$(BOOTDIR)/config-$(VERSION)
	install -m 444 linux-$(VERSION)/arch/$$(uname -m)/$(BOOTDIR)/bzImage $(DESTDIR)/$(BOOTDIR)/vmlinuz-$(VERSION)

clean:
	$(RM) -r linux-$(VERSION)/

distclean: clean
	$(RM) linux-$(VERSION).tar.bz2

linux-$(VERSION).tar.bz2:
	$(FETCH) http://www.kernel.org/pub/linux/kernel/v3.0/linux-$(VERSION).tar.bz2 > $@

linux-$(VERSION)/: linux-$(VERSION).tar.bz2
	tar xjf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

