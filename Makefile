# Stub makefile

.PHONY: all clean
all:
	@echo "Please read the README file to build bttr-linux"

README.html: README
	rst2html $< > $@

clean:
	$(RM) README.html

distclean:
	$(MAKE) -f Makefile.bootstrap CONFIG=any.bootstrap.mk clean

