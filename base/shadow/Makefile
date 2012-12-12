.PHONY: all build install clean

PREFIX=/usr
ifeq ($(PREFIX),/usr)
	SYSCONFDIR=/etc
else
	SYSCONFDIR=$(PREFIX)/etc
endif
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../shadow-4.1.5.1/configure \
		--prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR) \
		--with-libpam \
		--without-selinux
	@touch configure

prepare: shadow-4.1.5.1.tar.gz
	tar xzf shadow-4.1.5.1.tar.gz
	@mkdir build
	@touch prepare

shadow-4.1.5.1.tar.gz:
	wget http://pkg-shadow.alioth.debian.org/releases/shadow-4.1.5.1.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)
	# XXX Move this to a etc/shadow package?
	install -Dm744 useradd.defaults $(DESTDIR)/etc/default/useradd
	install -Dm644 login.defs $(DESTDIR)/etc/login.defs
	install -dm755 $(DESTDIR)/etc/pam.d
	install -t $(DESTDIR)/etc/pam.d -m644 passwd chgpasswd chpasswd newusers

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) shadow-4.1.5.1.tar.gz
	$(RM) -r build/
	$(RM) -r shadow-4.1.5.1/

