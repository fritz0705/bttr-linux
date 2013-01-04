.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C ex-050325 PREFIX=$(PREFIX) LIBEXECDIR=$(PREFIX)/lib/ex TERMLIB=ncurses 'FEATURES=-DCHDIR -DFASTTAG -DUCVISUAL -DMB -DBIT8'

configure: prepare

prepare: ex-050325.tar.bz2
	tar xjf ex-050325.tar.bz2
	@mkdir build
	@touch prepare

ex-050325.tar.bz2:
	wget http://downloads.sourceforge.net/sourceforge/ex-vi/ex-050325.tar.bz2

install: build
	$(MAKE) -C ex-050325 PREFIX=$(PREFIX) LIBEXECDIR=$(PREFIX)/lib/ex INSTALL=install DESTDIR=$(DESTDIR) install

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) ex-050325.tar.bz2
	$(RM) -r build/
	$(RM) -r ex-050325/

