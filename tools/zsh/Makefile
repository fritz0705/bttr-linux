PREFIX=/usr
DESTDIR=
ETCDIR=/etc/zsh

all: prepare
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
	$(MAKE) -C build all info

prepare: zsh-5.0.0.tar.bz2
	tar xjf zsh-5.0.0.tar.bz2
	mkdir -p build
	touch prepare

zsh-5.0.0.tar.bz2:
	wget http://www.zsh.org/pub/zsh-5.0.0.tar.bz2

install: all
	$(MAKE) -C build install install.info DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf zsh-5.0.0
	rm -f zsh-5.0.0.tar.bz2

