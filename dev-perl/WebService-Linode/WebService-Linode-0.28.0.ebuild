# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MODULE_AUTHOR="MIKEGRB"
MODULE_VERSION="0.28"
inherit perl-module

DESCRIPTION="Perl interface to the Linode.com API"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="test? ( virtual/perl-Test-Simple )
		dev-perl/Module-Build-Tiny"

RDEPEND="dev-perl/JSON
		 dev-perl/libwww-perl
		 dev-perl/LWP-Protocol-https"

SRC_TEST="do"
