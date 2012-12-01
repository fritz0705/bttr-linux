PACKAGES := acl attr bash binutils bzip2 coreutils gcc glibc gmp gzip libcap2 make ncurses pam readline tar util-linux xz
.PHONY: $(PACKAGES)

$(MAKECMDGOALS): $(PACKAGES)

$(PACKAGES):
	-$(MAKE) -C $@ $(MAKECMDGOALS)
