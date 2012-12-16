DESTDIR=

# Empty targets
all:
build:
configure:
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

