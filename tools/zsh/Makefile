.PHONY: all build install clean

PREFIX=/usr
DESTDIR=
ETCDIR=/etc/zsh

all: build

build: configure
	$(MAKE) -C build all info

configure: prepare
	cd build && ../zsh-5.0.0/configure --prefix=$(PREFIX) \
		--enable-etcdir=$(ETCDIR) \
		--enable-zshenv=$(ETCDIR)/zshenv \
		--enable-zlogin=$(ETCDIR)/zlogin \
		--enable-zlogout=$(ETCDIR)/zlogout \
		--enable-zprofile=$(ETCDIR)/zprofile \
		--enable-zshrc=$(ETCDIR)/zshrc \
		--enable-maildir-support \
		--with-term-lib='ncursesw' \
		--enable-multibyte \
		--enable-function-subdirs \
		--enable-fndir=$(PREFIX)/share/zsh/functions \
		--enable-scriptdir=$(PREFIX)/share/zsh/scripts \
		--with-tcsetpgrp \
		--enable-pcre \
		--enable-cap \
		--enable-zsh-secure-free
	@touch configure

prepare: zsh-5.0.0.tar.bz2
	tar xjf zsh-5.0.0.tar.bz2
	@mkdir build
	@touch prepare

zsh-5.0.0.tar.bz2:
	wget http://www.zsh.org/pub/zsh-5.0.0.tar.bz2

install: build
	$(MAKE) -C build install install.info DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) zsh-5.0.0.tar.bz2
	$(RM) -r build/
	$(RM) -r zsh-5.0.0/

