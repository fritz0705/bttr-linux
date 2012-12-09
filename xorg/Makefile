PACKAGES := $(shell ls | grep -v Makefile)
.PHONY: $(PACKAGES)

$(MAKECMDGOALS): $(PACKAGES)

$(PACKAGES):
	$(MAKE) -C $@ $(MAKECMDGOALS)

