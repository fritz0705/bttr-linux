.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C git-1.8.0.1 all prefix=$(PREFIX)

configure: prepare
	@touch configure

prepare: git-1.8.0.1.tar.gz
	tar xzf git-1.8.0.1.tar.gz
	@mkdir build
	@touch prepare

git-1.8.0.1.tar.gz:
	wget http://git-core.googlecode.com/files/git-1.8.0.1.tar.gz

install: build
	$(MAKE) -C git-1.8.0.1 install DESTDIR=$(DESTDIR) prefix=$(PREFIX)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) git-1.8.0.1.tar.gz
	$(RM) -r build/
	$(RM) -r git-1.8.0.1/

