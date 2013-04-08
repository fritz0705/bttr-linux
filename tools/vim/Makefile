.PHONY: all fetch unpack patch build install clean distclean

PREFIX ?= /usr
DESTDIR ?=
VERSION ?= 7.3
FETCH ?= curl -L

ifdef WITH_GUI
ifeq ($(WITH_GUI),YES)
WITH_GUI=gtk2
endif

_cfg_flags += --with-x=yes --enable-gui=$(WITH_GUI)
else
_cfg_flags += --with-x=no --disable-gui
endif

_cfg_flags += $(if $(WITH_RUBY),--enable-rubyinterp)
_cfg_flags += $(if $(WITH_LUA),--enable-luainterp)
_cfg_flags += $(if $(WITH_PYTHON),--enable-pythoninterp)
_cfg_flags += $(if $(WITH_PERL),--enable-perlinterp)
_cfg_flags += $(if $(WITH_NETBEANS),--enable-netbeans)
_cfg_flags += --enable-acl --enable-gpm --with-features=huge

override CONFIGURE_FLAGS := $(_cfg_flags) $(CONFIGURE_FLAGS)

all: build

fetch: vim-$(VERSION).tar.bz2
unpack: vim-$(VERSION)/
patch: unpack
prepare: vim-$(VERSION)/

configure: prepare
	cd vim-$(VERSION)/ && ./configure --prefix=$(PREFIX) $(CONFIGURE_FLAGS)
	@touch $@

build: configure
	$(MAKE) -C vim-$(VERSION)/

install: build
	$(MAKE) -j1 -C vim-$(VERSION)/ DESTDIR=$(DESTDIR) install

clean:
	$(RM) configure
	$(RM) -r vim-$(VERSION)/

distclean: clean
	$(RM) vim-$(VERSION).tar.bz2

vim-$(VERSION)/: vim-$(VERSION).tar.bz2
	tar xjf $<
	@mv vim$(subst .,,$(VERSION)) vim-$(VERSION)

vim-$(VERSION).tar.bz2:
	$(FETCH) ftp://ftp.vim.org/pub/vim/unix/vim-$(VERSION).tar.bz2 > $@

