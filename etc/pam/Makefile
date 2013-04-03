DESTDIR?=
VERSION?=1

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
	install -dm755 $(DESTDIR)/etc/pam.d
	install -m644 -t $(DESTDIR)/etc/pam.d \
		src/system-auth \
		src/system-local-login \
		src/system-login \
		src/system-remote-login \
		src/system-services \
		src/other

