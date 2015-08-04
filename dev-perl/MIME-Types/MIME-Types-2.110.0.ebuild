# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/MIME-Types/MIME-Types-2.110.0.ebuild,v 1.1 2015/07/23 23:47:11 dilfridge Exp $

EAPI=5

MODULE_AUTHOR=MARKOV
MODULE_VERSION=2.11
inherit perl-module

DESCRIPTION="Definition of MIME types"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~sparc-solaris ~x86-solaris"
IUSE="test"

# uses List::Util
RDEPEND="
	virtual/perl-File-Spec
	virtual/perl-Scalar-List-Utils
"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? ( >=virtual/perl-Test-Simple-0.470.0 )
"

SRC_TEST="do parallel"
