PREFIX=/usr
DESTDIR=

all: prepare

prepare: man-pages-3.44.tar.gz
	tar xzf man-pages-3.44.tar.gz
	mkdir -p build
	touch prepare

man-pages-3.44.tar.gz:
	wget http://www.kernel.org/pub/linux/docs/man-pages/man-pages-3.44.tar.gz

install: all
	$(MAKE) -C man-pages-3.44 install prefix=$(PREFIX) DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf man-pages-3.44
	rm -f man-pages-3.44.tar.gz

