PACKAGES := $(shell find -maxdepth 1 -mindepth 1 -type d -not -name '.*' -printf '%f\n')
.PHONY: $(PACKAGES) $(MAKECMDGOALS) _

_ $(MAKECMDGOALS): $(PACKAGES)

$(PACKAGES):
	$(if $(F),-,)$(MAKE) -C $@ $(MAKECMDGOALS)

