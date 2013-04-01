DESTDIR=
VERSION=1

# Empty targets
all:
fetch:
unpack:
patch:
prepare:
configure:
build:
clean:
distclean:

install:
	# /
	install -dm755 $(DESTDIR)/boot $(DESTDIR)/dev $(DESTDIR)/etc $(DESTDIR)/home \
		$(DESTDIR)/mnt $(DESTDIR)/usr $(DESTDIR)/var $(DESTDIR)/opt $(DESTDIR)/opt \
		$(DESTDIR)/bin $(DESTDIR)/sbin
	install -dm555 $(DESTDIR)/proc $(DESTDIR)/sys
	install -dm0750 $(DESTDIR)/root
	install -dm1777 $(DESTDIR)/tmp
	install -dm755 $(DESTDIR)/lib64
	ln -sf lib64 $(DESTDIR)/lib
	# /var
	install -dm755 $(DESTDIR)/var/local $(DESTDIR)/var/opt $(DESTDIR)/var/log \
		$(DESTDIR)/var/lib $(DESTDIR)/var/cache $(DESTDIR)/var/empty
	install -dm1777 $(DESTDIR)/var/tmp $(DESTDIR)/var/spool $(DESTDIR)/var/mail
	# /usr
	install -dm755 $(DESTDIR)/usr/bin $(DESTDIR)/usr/include $(DESTDIR)/usr/sbin \
		$(DESTDIR)/usr/share $(DESTDIR)/usr/src $(DESTDIR)/usr/lib $(DESTDIR)/usr/lib64
	# /usr/local
	install -dm755 $(DESTDIR)/usr/local/bin $(DESTDIR)/usr/local/games \
		$(DESTDIR)/usr/local/etc $(DESTDIR)/usr/local/include \
		$(DESTDIR)/usr/local/lib $(DESTDIR)/usr/local/lib64 \
		$(DESTDIR)/usr/local/man $(DESTDIR)/usr/local/sbin \
		$(DESTDIR)/usr/local/share $(DESTDIR)/usr/local/src
	# /etc
	ln -sf /proc/self/mounts $(DESTDIR)/etc/mtab

