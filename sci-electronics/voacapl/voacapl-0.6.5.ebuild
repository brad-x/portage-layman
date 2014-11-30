# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-electronics/voacapl/voacapl-0.6.5.ebuild,v 1.1 2014/11/23 15:25:39 tomjbe Exp $

EAPI="5"

inherit fortran-2

DESCRIPTION="HF propagation prediction tool"
HOMEPAGE="http://www.qsl.net/hz1jw/voacapl/index.html"
SRC_URI="http://www.qsl.net/hz1jw/${PN}/downloads/${P}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror bindist"

src_compile() {
	# bug 513766
	emake -j1 DESTDIR="${D}"
}

src_install() {
	emake DESTDIR="${D}" docdir=/usr/share/doc/${PF} install
}
