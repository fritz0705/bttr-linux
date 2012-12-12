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
	cd build && ../wget-1.14/configure --prefix=$(PREFIX) \
		--with-ssl=openssl \
		--sysconfdir=$(SYSCONFDIR)
	@touch configure

prepare: wget-1.14.tar.gz
	tar xzf wget-1.14.tar.gz
	@mkdir build
	@touch prepare

wget-1.14.tar.gz:
	wget ftp://ftp.gnu.org/gnu/wget/wget-1.14.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) wget-1.14.tar.gz
	$(RM) -r build/
	$(RM) -r wget-1.14/

