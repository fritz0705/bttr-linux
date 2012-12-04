PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../file-5.11/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: file-5.11.tar.gz
	tar xzf file-5.11.tar.gz
	mkdir -p build
	touch prepare

file-5.11.tar.gz:
	wget ftp://ftp.astron.com/pub/file/file-5.11.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f file-5.11.tar.gz
	rm -rf file-5.11
