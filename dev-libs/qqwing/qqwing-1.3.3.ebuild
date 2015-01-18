# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/qqwing/qqwing-1.3.3.ebuild,v 1.2 2014/12/30 19:52:45 maekke Exp $

EAPI=5

inherit autotools eutils

DESCRIPTION="Sudoku puzzle generator and solver"
HOMEPAGE="http://qqwing.com/"
SRC_URI="https://github.com/stephenostermiller/${PN}/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_prepare() {
	# Make autotools work out of the box
	epatch "${FILESDIR}"/${PN}-1.3.0-autotools.patch

	eautoreconf
}
