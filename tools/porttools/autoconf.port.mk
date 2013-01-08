.PHONY: all build install clean

ifndef PREFIX
ifdef NAME
PREFIX = /opt/$(NAME)
else
PREFIX = /usr/local
endif
endif

override BUILD_DIR = build/

ifeq ($(DISABLE_BUILD_DIR),yes)
override BUILD_DIR = $(SOURCE_DIR)
endif

override __configure_flags = --prefix=$(PREFIX)

ifdef SYSCONFDIR
override __configure_flags += --sysconfdir=$(SYSCONFDIR)
endif

ifdef BINDIR
override __configure_flags += --bindir=$(BINDIR)
endif

ifdef SBINDIR
override __configure_flags += --sbindir=$(SBINDIR)
endif

ifdef LIBEXECDIR
override __configure_flags += --libexecdir=$(LIBEXECDIR)
endif

ifdef LOCALSTATEDIR
override __configure_flags += --localstatedir=$(LOCALSTATEDIR)
endif

ifdef LIBDIR
override __configure_flags += --libdir=$(LIBDIR)
endif

ifdef INCLUDEDIR
override __configure_flags += --includedir=$(INCLUDEDIR)
endif

ifdef DATADIR
override __configure_flags += --datadir=$(DATADIR)
endif

ifdef DOCDIR
override __configure_flags += --docdir=$(DOCDIR)
endif

ifdef PPREFIX
override __configure_flags += --program-prefix=$(PPREFIX)
endif

FETCH=curl

override __configure_flags += $(CONFIGURE_FLAGS)

all: build

build: configure
	$(MAKE) -C $(BUILD_DIR)

configure: prepare
	cd $(BUILD_DIR) && ../$(SOURCE_DIR)/configure $(__configure_flags)
	@touch configure

prepare: $(SOURCE_FILE)
	tar -x $(TAR_FLAGS) -f $(SOURCE_FILE)
	@mkdir build
	@touch prepare

$(SOURCE_FILE):
	$(FETCH) $(SOURCE_URL) > $(SOURCE_FILE)

install: build
	$(MAKE) -C $(BUILD_DIR) install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) $(SOURCE_FILE)
	$(RM) -r $(BUILD_DIR)
	$(RM) -r $(SOURCE_DIR)

