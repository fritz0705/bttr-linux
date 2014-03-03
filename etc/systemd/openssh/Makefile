.PHONY: all fetch unpack patch prepare configure build install clean distclean

SYSTEMD_TYPE?=system
SYSTEMD_PREFIX?=/usr

PREFIX?=/usr
BINDIR?=$(PREFIX)/bin
DESTDIR?=
VERSION?=1

SSHD_PATH?=$(BINDIR)/sshd

UNIT_PATH?=$(DESTDIR)/$(SYSTEMD_PREFIX)/lib/systemd/$(SYSTEMD_TYPE)

all: build
fetch:
unpack:
patch:
prepare:
configure:

sshd.service: sshd.service.m4
	m4 -D__SSHD_PATH__=$(SSHD_PATH) $< > $@

sshd@.service: sshd@.service.m4
	m4 -D__SSHD_PATH__=$(SSHD_PATH) $< > $@

build: sshd.service sshd@.service

install: build
	install -dm755 $(UNIT_PATH)
	install -m644 sshd@.service sshd.socket sshd.service $(UNIT_PATH)/

clean:
	$(RM) sshd.service

distclean: clean


.PHONY: Version
Version:
	@echo $(VERSION) > $@

