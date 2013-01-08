#!/usr/bin/env perl
# (c) 2013 Fritz Conrad Grimpen

use strict;
use warnings;
use v5.14;

use File::Path;
use Getopt::Std;
use Cwd;
use Fcntl;

my %opts = ();
getopts("hvt:", \%opts);

if ($opts{'h'}) {
	print <<HELP
usage: port_create [-hv] [-t TYPE] [--] NAME...

	-h	print this help
	-v	verbose output
	-t TYPE	use TYPE as template

port_create supports the following values for TYPE:

	generic	generic port
	empty	empty port
	autoconf	port is built from autoconf package
	cmake	port is built using CMake
HELP
	; exit(0);
}

my $root = getcwd;
my $type = 'generic';
if ($opts{'t'}) {
	$type = $opts{'t'};
}

my $port;
foreach $port (@ARGV) {
	say("Create port $port") if $opts{'v'};
	File::Path::make_path($port);
	chdir($port);

	for ($type) {
		when ("generic") {
			my $makefile = <<'MAKE'
.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	# Build instructions

configure: prepare
	# Configuration instructions
	@touch configure

prepare:
	# Prepare instructions
	@mkdir build
	@touch prepare

install: build
	# Installation instructions

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) -r build/
MAKE
			;

			sysopen(my $makefd, "Makefile", O_WRONLY|O_CREAT);
			print $makefd $makefile;
			close($makefd);

			my $gitignore = <<'GITIGNORE'
prepare
configure
build/
GITIGNORE
			;

			sysopen(my $gitfd, ".gitignore", O_WRONLY|O_CREAT);
			print $gitfd $gitignore;
			close($gitfd);
		}
		when ("empty") {
		}
		when ("autoconf") {
			my $makefile = <<'MAKE'
# VERSION=0.1
# SOURCE_DIR=example-$(VERSION)
# SOURCE_FILE=$(SOUCRE_DIR).tar.gz
# SOURCE_URL=http://example.org/download/$(SOURCE_FILE)

# CONFIGURE_FLAGS=--enable-fnord

# PREFIX=/
# SYSCONFDIR=/etc

# TAR_FLAGS=z
# DISABLE_BUILD_DIR=yes

.include 'autoconf.port.mk'
MAKE
			;

			sysopen(my $makefd, "Makefile", O_WRONLY|O_CREAT);
			print $makefd $makefile;
			close($makefd);

			my $gitignore = <<'GITIGNORE'
prepare
configure
build/
GITIGNORE
			;

			sysopen(my $gitfd, ".gitignore", O_WRONLY|O_CREAT);
			print $gitfd $gitignore;
			close($gitfd);
		}
		when ("cmake") {
		}
	}

	chdir($root);
}

