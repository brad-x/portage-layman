# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Finance-YahooQuote/Finance-YahooQuote-0.250.0.ebuild,v 1.1 2015/06/21 18:56:21 dilfridge Exp $

EAPI=5

MODULE_AUTHOR=EDD
MODULE_VERSION=0.25
inherit perl-module

DESCRIPTION="Get stock quotes from Yahoo! Finance"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND="
	dev-perl/libwww-perl
	virtual/perl-MIME-Base64
	>=dev-perl/HTML-Parser-2.200.0
	>=virtual/perl-Text-ParseWords-3.100.0
"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
"

SRC_TEST=online
