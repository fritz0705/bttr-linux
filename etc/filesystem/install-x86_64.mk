# On x86_64 platforms, we prefer a traditional, non-systemd filesystem layout

install:
	# /
	install -dm755 $(DESTDIR)/boot $(DESTDIR)/dev $(DESTDIR)/etc $(DESTDIR)/home \
		$(DESTDIR)/mnt $(DESTDIR)/usr $(DESTDIR)/var $(DESTDIR)/opt $(DESTDIR)/opt \
		$(DESTDIR)/bin $(DESTDIR)/sbin
	install -dm555 $(DESTDIR)/proc $(DESTDIR)/sys
	install -dm0750 $(DESTDIR)/root
	install -dm1777 $(DESTDIR)/tmp
	install -dm755 $(DESTDIR)/lib
	ln -sf lib $(DESTDIR)/lib64
	# /var
	install -dm755 $(DESTDIR)/var/local $(DESTDIR)/var/opt $(DESTDIR)/var/log \
		$(DESTDIR)/var/lib $(DESTDIR)/var/cache $(DESTDIR)/var/empty
	install -dm1777 $(DESTDIR)/var/tmp $(DESTDIR)/var/spool $(DESTDIR)/var/mail
	# /usr
	install -dm755 $(DESTDIR)/usr/bin $(DESTDIR)/usr/include $(DESTDIR)/usr/sbin \
		$(DESTDIR)/usr/share $(DESTDIR)/usr/src $(DESTDIR)/usr/lib
	ln -sf lib $(DESTDIR)/usr/lib
	# /usr/local
	install -dm755 $(DESTDIR)/usr/local/bin $(DESTDIR)/usr/local/games \
		$(DESTDIR)/usr/local/etc $(DESTDIR)/usr/local/include \
		$(DESTDIR)/usr/local/lib $(DESTDIR)/usr/local/lib \
		$(DESTDIR)/usr/local/man $(DESTDIR)/usr/local/sbin \
		$(DESTDIR)/usr/local/share $(DESTDIR)/usr/local/src
	ln -sf lib $(DESTDIR)/usr/local/lib64
	# /etc
	ln -sf /proc/self/mounts $(DESTDIR)/etc/mtab
	# /run
	install -dm755 $(DESTDIR)/run
	ln -sf ../run $(DESTDIR)/var/run

