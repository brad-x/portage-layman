# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Module-Runtime-Conflicts/Module-Runtime-Conflicts-0.2.0.ebuild,v 1.1 2015/07/25 20:19:07 dilfridge Exp $

EAPI=5

MODULE_AUTHOR=ETHER
MODULE_VERSION=0.002
inherit perl-module

DESCRIPTION="Provide information on conflicts for Module::Runtime"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-perl/Dist-CheckConflicts
	dev-perl/Module-Runtime
"
DEPEND="${RDEPEND}
	>=dev-perl/Module-Build-Tiny-0.39.0
	test? (
		virtual/perl-ExtUtils-MakeMaker
		virtual/perl-File-Spec
		>=virtual/perl-Test-Simple-0.880.0
		virtual/perl-if
	)
"

SRC_TEST="do parallel"
