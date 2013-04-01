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
	install -dm755 $(DESTDIR)/etc
	
	# Trusted config files
	install -m644 src/fstab $(DESTDIR)/etc
	install -m644 src/group $(DESTDIR)/etc
	install -m644 src/host.conf $(DESTDIR)/etc
	install -m644 src/hosts $(DESTDIR)/etc
	install -m644 src/issue $(DESTDIR)/etc
	install -m644 src/ld.so.conf $(DESTDIR)/etc
	install -m644 src/motd $(DESTDIR)/etc
	install -m644 src/nsswitch.conf $(DESTDIR)/etc
	install -m644 src/passwd $(DESTDIR)/etc
	install -m644 src/profile $(DESTDIR)/etc
	install -m644 src/resolv.conf $(DESTDIR)/etc
	install -m644 src/securetty $(DESTDIR)/etc
	install -m644 src/shells $(DESTDIR)/etc
	
	# Secure config files
	install -m600 src/gshadow $(DESTDIR)/etc
	install -m600 src/shadow $(DESTDIR)/etc
	install -m600 src/crypttab $(DESTDIR)/etc

