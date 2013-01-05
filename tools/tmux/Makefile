.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build/ && ../tmux-1.7/configure --prefix=$(PREFIX)
	@touch configure

prepare: tmux-1.7.tar.gz
	tar xzf tmux-1.7.tar.gz
	@mkdir build
	@touch prepare

tmux-1.7.tar.gz:
	wget http://downloads.sourceforge.net/tmux/tmux-1.7.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) tmux-1.7.tar.gz
	$(RM) -r build/
	$(RM) -r tmux-1.7/

