DESTDIR=

# Empty targets
all:
prepare:
clean:

install:
	install -dm755 $(DESTDIR)/etc/pam.d
	install -m644 -t $(DESTDIR)/etc/pam.d \
		system-auth \
		system-local-login \
		system-login \
		system-remote-login \
		system-services \
		other

