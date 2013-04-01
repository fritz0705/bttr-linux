.PHONY: all fetch unpack patch prepare configure build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=1.8.2
FETCH=curl

all: build

fetch: git-$(VERSION).tar.gz
unpack: git-$(VERSION)/
patch: unpack
prepare: git-$(VERSION)/
configure: prepare

build: configure
	$(MAKE) -C git-$(VERSION) all prefix=$(PREFIX)

install: build
	$(MAKE) -C git-$(VERSION) install DESTDIR=$(DESTDIR) prefix=$(PREFIX)

clean:
	$(RM) -r git-$(VERSION)/

distclean: clean
	$(RM) git-$(VERSION).tar.gz

git-$(VERSION).tar.gz:
	$(FETCH) http://git-core.googlecode.com/files/git-$(VERSION).tar.gz > $@

git-$(VERSION)/: git-$(VERSION).tar.gz
	tar xzf $<

