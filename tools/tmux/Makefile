.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=1.8
FETCH?=curl -L --retry 3

all: build

fetch: tmux-$(VERSION).tar.gz
unpack: tmux-$(VERSION)/
patch: unpack
prepare: tmux-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build/ && ../tmux-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r tmux-$(VERSION)/

distclean: clean
	$(RM) tmux-$(VERSION).tar.gz

tmux-$(VERSION).tar.gz:
	$(FETCH) http://downloads.sourceforge.net/tmux/tmux-$(VERSION).tar.gz > $@

tmux-$(VERSION)/: tmux-$(VERSION).tar.gz
	tar xzf $<

