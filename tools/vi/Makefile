PREFIX=/usr
DESTDIR=

all: prepare
	$(MAKE) -C ex-050325 PREFIX=$(PREFIX) LIBEXECDIR=$(PREFIX)/lib/ex TERMLIB=ncurses 'FEATURES=-DCHDIR -DFASTTAG -DUCVISUAL -DMB -DBIT8'

prepare: ex-050325.tar.bz2
	tar xjf ex-050325.tar.bz2
	mkdir -p build
	touch prepare

ex-050325.tar.bz2:
	wget http://downloads.sourceforge.net/sourceforge/ex-vi/ex-050325.tar.bz2

install: all
	$(MAKE) -C ex-050325 PREFIX=$(PREFIX) LIBEXECDIR=$(PREFIX)/lib/ex INSTALL=install DESTDIR=$(DESTDIR) install

clean:
	rm -rf build/
	rm -f prepare
	rm -rf ex-050325
	rm -f ex-050325.tar.bz2
