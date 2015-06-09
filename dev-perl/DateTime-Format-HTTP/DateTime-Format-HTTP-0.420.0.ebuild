# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/DateTime-Format-HTTP/DateTime-Format-HTTP-0.420.0.ebuild,v 1.1 2015/05/03 17:52:15 dilfridge Exp $

EAPI=5

MODULE_AUTHOR=CKRAS
MODULE_VERSION=0.42
inherit perl-module

DESCRIPTION="Date conversion routines"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	>=dev-perl/DateTime-0.170.0
	>=dev-perl/HTTP-Date-1.440.0
"
DEPEND="${RDEPEND}
	>=virtual/perl-Module-Build-0.380.0
	test? ( >=virtual/perl-Test-Simple-0.470.0 )
"

SRC_TEST=do
