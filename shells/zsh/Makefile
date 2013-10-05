.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
ETCDIR?=/etc/zsh
FETCH?=curl
VERSION?=5.0.2

all: build

fetch: zsh-$(VERSION).tar.bz2
unpack: zsh-$(VERSION)/
patch: unpack
prepare: zsh-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../zsh-$(VERSION)/configure --prefix=$(PREFIX) \
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
	@touch $@

build: configure
	$(MAKE) -C build all info

install: build
	$(MAKE) -C build install install.info DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r zsh-$(VERSION)/

distclean: clean
	$(RM) zsh-$(VERSION).tar.bz2

zsh-$(VERSION).tar.bz2:
	$(FETCH) http://www.zsh.org/pub/zsh-$(VERSION).tar.bz2 > $@

zsh-$(VERSION)/: zsh-$(VERSION).tar.bz2
	tar xjf $<

