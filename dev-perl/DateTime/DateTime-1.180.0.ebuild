# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/DateTime/DateTime-1.180.0.ebuild,v 1.1 2015/05/03 13:32:40 dilfridge Exp $

EAPI=5

MODULE_AUTHOR=DROLSKY
MODULE_VERSION=1.18
inherit perl-module

DESCRIPTION="A date and time object"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE="test"

RDEPEND="
	virtual/perl-Carp
	>=dev-perl/DateTime-Locale-0.410.0
	>=dev-perl/DateTime-TimeZone-1.740.0
	>=dev-perl/Params-Validate-0.760.0
	virtual/perl-Scalar-List-Utils
	dev-perl/Try-Tiny
	virtual/perl-XSLoader
"
DEPEND="${RDEPEND}
	>=virtual/perl-Module-Build-0.280.0
	test? (
		virtual/perl-ExtUtils-MakeMaker
		virtual/perl-File-Spec
		virtual/perl-Storable
		dev-perl/Test-Fatal
		>=virtual/perl-Test-Simple-0.880.0
		>=dev-perl/Test-Warnings-0.5.0
	)
"

SRC_TEST=do
