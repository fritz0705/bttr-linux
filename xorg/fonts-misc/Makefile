# TODO Split this package up
PREFIX=/usr
DESTDIR=

override sources = font-arabic-misc-1.0.1.tar.bz2 font-cursor-misc-1.0.1.tar.bz2 font-daewoo-misc-1.0.1.tar.bz2 font-dec-misc-1.0.1.tar.bz2 font-isas-misc-1.0.1.tar.bz2 font-jis-misc-1.0.1.tar.bz2 font-micro-misc-1.0.1.tar.bz2 font-misc-misc-1.1.0.tar.bz2 font-mutt-misc-1.0.1.tar.bz2 font-schumacher-misc-1.1.0.tar.bz2 font-sony-misc-1.0.1.tar.bz2 font-sun-misc-1.0.1.tar.bz2
override url = http://xorg.freedesktop.org/releases/individual/font/

all: prepare
	cd font-arabic-misc-1.0.1/     && \
		./configure --prefix=$(PREFIX) --with-fontdir=$(PREFIX)/share/fonts/misc && $(MAKE)
	cd font-cursor-misc-1.0.1/     && \
		./configure --prefix=$(PREFIX) --with-fontdir=$(PREFIX)/share/fonts/misc && $(MAKE)
	cd font-daewoo-misc-1.0.1/     && \
		./configure --prefix=$(PREFIX) --with-fontdir=$(PREFIX)/share/fonts/misc && $(MAKE)
	cd font-dec-misc-1.0.1/        && \
		./configure --prefix=$(PREFIX) --with-fontdir=$(PREFIX)/share/fonts/misc && $(MAKE)
	cd font-isas-misc-1.0.1/       && \
		./configure --prefix=$(PREFIX) --with-fontdir=$(PREFIX)/share/fonts/misc && $(MAKE)
	cd font-micro-misc-1.0.1/      && \
		./configure --prefix=$(PREFIX) --with-fontdir=$(PREFIX)/share/fonts/misc && $(MAKE)
	cd font-misc-misc-1.1.0/       && \
		./configure --prefix=$(PREFIX) --with-fontdir=$(PREFIX)/share/fonts/misc && $(MAKE)
	cd font-mutt-misc-1.0.1/       && \
		./configure --prefix=$(PREFIX) --with-fontdir=$(PREFIX)/share/fonts/misc && $(MAKE)
	cd font-schumacher-misc-1.1.0/ && \
		./configure --prefix=$(PREFIX) --with-fontdir=$(PREFIX)/share/fonts/misc && $(MAKE)
	cd font-sony-misc-1.0.1/       && \
		./configure --prefix=$(PREFIX) --with-fontdir=$(PREFIX)/share/fonts/misc && $(MAKE)
	cd font-sun-misc-1.0.1/        && \
		./configure --prefix=$(PREFIX) --with-fontdir=$(PREFIX)/share/fonts/misc && $(MAKE)

prepare: $(sources)
	tar xjf font-arabic-misc-1.0.1.tar.bz2
	tar xjf font-cursor-misc-1.0.1.tar.bz2
	tar xjf font-daewoo-misc-1.0.1.tar.bz2
	tar xjf font-dec-misc-1.0.1.tar.bz2
	tar xjf font-isas-misc-1.0.1.tar.bz2
	tar xjf font-jis-misc-1.0.1.tar.bz2
	tar xjf font-micro-misc-1.0.1.tar.bz2
	tar xjf font-misc-misc-1.1.0.tar.bz2
	tar xjf font-mutt-misc-1.0.1.tar.bz2
	tar xjf font-schumacher-misc-1.1.0.tar.bz2
	tar xjf font-sony-misc-1.0.1.tar.bz2
	tar xjf font-sun-misc-1.0.1.tar.bz2
	mkdir -p build
	touch prepare

$(sources):
	wget $(url)/$@

install: all
	cd font-arabic-misc-1.0.1/     && \
		$(MAKE) install DESTDIR=$(DESTDIR)
	cd font-cursor-misc-1.0.1/     && \
		$(MAKE) install DESTDIR=$(DESTDIR)
	cd font-daewoo-misc-1.0.1/     && \
		$(MAKE) install DESTDIR=$(DESTDIR)
	cd font-dec-misc-1.0.1/        && \
		$(MAKE) install DESTDIR=$(DESTDIR)
	cd font-isas-misc-1.0.1/       && \
		$(MAKE) install DESTDIR=$(DESTDIR)
	cd font-micro-misc-1.0.1/      && \
		$(MAKE) install DESTDIR=$(DESTDIR)
	cd font-misc-misc-1.1.0/       && \
		$(MAKE) install DESTDIR=$(DESTDIR)
	cd font-mutt-misc-1.0.1/       && \
		$(MAKE) install DESTDIR=$(DESTDIR)
	cd font-schumacher-misc-1.1.0/ && \
		$(MAKE) install DESTDIR=$(DESTDIR)
	cd font-sony-misc-1.0.1/       && \
		$(MAKE) install DESTDIR=$(DESTDIR)
	cd font-sun-misc-1.0.1/        && \
		$(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f $(sources)
	find -maxdepth 1 -type d -name 'font-*-misc-*' -exec rm -rvf {} \;

