# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/List-AllUtils/List-AllUtils-0.90.0.ebuild,v 1.4 2014/12/28 16:26:59 zlogene Exp $

EAPI=5

MODULE_AUTHOR=DROLSKY
MODULE_VERSION=0.08
inherit perl-module

DESCRIPTION='Combines List::Util and List::MoreUtils in one bite-sized package'

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~x86 ~amd64-fbsd"
IUSE="test"

RDEPEND=">=dev-perl/List-MoreUtils-0.280.0
	>=virtual/perl-Scalar-List-Utils-1.310.0"

DEPEND="${RDEPEND}
	>=virtual/perl-ExtUtils-MakeMaker-6.300.0
		test? (
	virtual/perl-File-Temp
	>=virtual/perl-Test-Simple-0.880.0
	dev-perl/Test-Warnings	)"

SRC_TEST="do"
