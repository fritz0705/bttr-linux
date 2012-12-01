PREFIX=/usr
DESTDIR=

all: prepare
	$(MAKE) -C git-1.8.0.1 all prefix=$(PREFIX)

prepare: git-1.8.0.1.tar.gz
	tar xzf git-1.8.0.1.tar.gz
	touch prepare

git-1.8.0.1.tar.gz:
	wget http://git-core.googlecode.com/files/git-1.8.0.1.tar.gz

install: all
	$(MAKE) -C git-1.8.0.1 install DESTDIR=$(DESTDIR) prefix=$(PREFIX)

clean:
	rm -f prepare
	rm -f git-1.8.0.1.tar.gz
	rm -rf git-1.8.0.1

