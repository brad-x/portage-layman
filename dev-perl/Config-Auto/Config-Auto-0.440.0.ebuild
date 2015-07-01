# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Config-Auto/Config-Auto-0.440.0.ebuild,v 1.1 2015/05/01 20:13:07 dilfridge Exp $

EAPI=5

MODULE_AUTHOR=BINGOS
MODULE_VERSION=0.44
inherit perl-module

DESCRIPTION="Magical config file parser"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-perl/Config-IniFiles
	dev-perl/IO-String
	virtual/perl-Text-ParseWords
	virtual/perl-File-Spec
	>=dev-perl/yaml-0.670.0
"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? ( virtual/perl-Test-Simple )
"

SRC_TEST="do"