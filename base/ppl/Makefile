.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=GIT
#VERSION?=1.0
FETCH?=curl -L --retry 3

ifeq ($(VERSION),GIT)
GIT_REVISION ?= master
endif

all: build

fetch: ppl-$(VERSION).tar.gz
unpack: ppl-$(VERSION)/
patch: unpack
prepare: ppl-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../ppl-$(VERSION)/configure --prefix=$(PREFIX) --disable-documentation
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -j1 -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
ifneq ($(VERSION),GIT)
	$(RM) -r ppl-$(VERSION)/
endif

distclean: clean
	$(RM) ppl-$(VERSION).tar.gz
	$(RM) -r ppl-GIT/

ifeq ($(VERSION),GIT)
.PHONY: ppl-GIT/
ppl-GIT/:
	[ -d $@ ] && (git --git-dir=$@/.git pull) || (git clone git://git.cs.unipr.it/ppl/ppl.git $@)
	git --git-dir=$@/.git pull
	git --git-dir=$@/.git checkout $(GIT_REVISION)
	cd $@ && (autoreconf || (automake --add-missing && autoreconf))
else
ppl-$(VERSION).tar.gz:
	$(FETCH) http://bugseng.com/products/ppl/download/ftp/releases/$(VERSION)/ppl-$(VERSION).tar.gz > $@

ppl-$(VERSION)/: ppl-$(VERSION).tar.gz
	tar xzf $<
endif

