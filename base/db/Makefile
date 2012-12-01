PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../db-5.3.21/dist/configure --prefix=$(PREFIX) \
		--enable-compat185 \
		--enable-shared \
		--enable-static \
		--enable-cxx \
		--enable-dbm
	$(MAKE) -C build LIBSO_LIBS=-lpthread

prepare: db-5.3.21.tar.gz
	tar xzf db-5.3.21.tar.gz
	mkdir -p build
	touch prepare

db-5.3.21.tar.gz:
	wget http://download.oracle.com/berkeley-db/db-5.3.21.tar.gz

install: all
	yes | $(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f db-5.3.21.tar.gz
	rm -rf db-5.3.21

