# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-benchmarks/i7z/i7z-0.27.2.ebuild,v 1.6 2015/07/28 07:54:07 jlec Exp $

EAPI=5

inherit eutils flag-o-matic qmake-utils toolchain-funcs

DESCRIPTION="A better i7 (and now i3, i5) reporting tool for Linux"
HOMEPAGE="http://code.google.com/p/i7z/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="X"

RDEPEND="
	sys-libs/ncurses
	X? ( dev-qt/qtgui:4 )"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-ncurses.patch
	tc-export CC
}

src_compile() {
	default
	if use X; then
		cd GUI
		eqmake4 ${PN}_GUI.pro && emake clean && emake
	fi
}

src_install() {
	emake DESTDIR="${ED}" docdir=/usr/share/doc/${PF} install
	use X && dosbin GUI/i7z_GUI
}
