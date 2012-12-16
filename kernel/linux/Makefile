DESTDIR=

all: prepare configure
	$(MAKE) -C linux-3.6.8 all

configure: prepare
ifeq ($(KCONFIG),)
	$(MAKE) -C linux-3.6.8 defconfig
else
	cp $(KCONFIG) linux-3.6.8/.config
	$(MAKE) -C linux-3.6.8 silentoldconfig
endif

prepare: linux-3.6.8.tar.bz2
	tar xjf linux-3.6.8.tar.bz2
	touch prepare

linux-3.6.8.tar.bz2:
	wget http://www.kernel.org/pub/linux/kernel/v3.0/linux-3.6.8.tar.bz2

install: all
	install -d -m755 $(DESTDIR)/lib/modules
	install -d -m755 $(DESTDIR)/lib/firmware
	install -d -m755 $(DESTDIR)/boot
	$(MAKE) -C linux-3.6.8 modules_install INSTALL_MOD_PATH=$(DESTDIR)
	$(MAKE) -C linux-3.6.8 firmware_install INSTALL_FW_PATH=$(DESTDIR)/lib/firmware
	$(MAKE) -C linux-3.6.8 headers_install INSTALL_HDR_PATH=$(DESTDIR)/usr/include/linux
	cp linux-3.6.8/.config $(DESTDIR)/boot/config
	cp linux-3.6.8/arch/x86/boot/bzImage $(DESTDIR)/boot/vmlinuz

clean:
	rm -rf build/
	rm -f prepare
	rm -rf linux-3.6.8
	rm -f linux-3.6.8.tar.bz2

