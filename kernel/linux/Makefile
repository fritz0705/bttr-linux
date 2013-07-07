DESTDIR?=

VERSION?=3.10
FETCH?=curl -L

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
	install -d -m755 $(DESTDIR)/usr/include
	$(MAKE) -C linux-$(VERSION) headers_install
	cp -r linux-$(VERSION)/usr/include/. $(DESTDIR)/usr/include

install: install-headers build
	install -d -m755 $(DESTDIR)/lib/modules
	install -d -m755 $(DESTDIR)/lib/firmware
	install -d -m755 $(DESTDIR)/boot
	$(MAKE) -C linux-$(VERSION) modules_install INSTALL_MOD_PATH=$(DESTDIR)
	$(MAKE) -C linux-$(VERSION) firmware_install INSTALL_FW_PATH=$(DESTDIR)/lib/firmware
	install -m 444 linux-$(VERSION)/.config $(DESTDIR)/boot/config-$(VERSION)
	install -m 444 linux-$(VERSION)/arch/$$(uname -m)/boot/bzImage $(DESTDIR)/boot/vmlinuz-$(VERSION)

clean:
	$(RM) -r linux-$(VERSION)/

distclean: clean
	$(RM) linux-$(VERSION).tar.bz2

linux-$(VERSION).tar.bz2:
	$(FETCH) http://www.kernel.org/pub/linux/kernel/v3.0/linux-$(VERSION).tar.bz2 > $@

linux-$(VERSION)/: linux-$(VERSION).tar.bz2
	tar xjf $<

