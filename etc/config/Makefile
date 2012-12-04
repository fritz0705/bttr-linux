DESTDIR=

# Empty targets
all:
prepare:
clean:

install:
	install -dm755 $(DESTDIR)/etc
	
	# Trusted config files
	install -m644 fstab $(DESTDIR)/etc
	install -m644 group $(DESTDIR)/etc
	install -m644 host.conf $(DESTDIR)/etc
	install -m644 hosts $(DESTDIR)/etc
	install -m644 issue $(DESTDIR)/etc
	install -m644 ld.so.conf $(DESTDIR)/etc
	install -m644 motd $(DESTDIR)/etc
	install -m644 nsswitch.conf $(DESTDIR)/etc
	install -m644 passwd $(DESTDIR)/etc
	install -m644 profile $(DESTDIR)/etc
	install -m644 resolv.conf $(DESTDIR)/etc
	install -m644 securetty $(DESTDIR)/etc
	install -m644 shells $(DESTDIR)/etc
	
	# Secure config files
	install -m600 gshadow $(DESTDIR)/etc
	install -m600 shadow $(DESTDIR)/etc
	install -m600 crypttab $(DESTDIR)/etc

