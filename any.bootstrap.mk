ifndef SUBDIR
SUBDIR := ./
endif

ifneq ($(shell git rev-parse HEAD),)
PACKAGES := $(shell git ls-tree -r --name-only $$(git rev-parse HEAD) $(SUBDIR) | grep "\/Makefile$$" | sed 's/\/Makefile$$//')
else
PACKAGES := $(shell find $(SUBDIR) -mindepth 1 -name Makefile -type f -printf "%h\n")
endif
