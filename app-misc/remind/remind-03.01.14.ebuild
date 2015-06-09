# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/remind/remind-03.01.14.ebuild,v 1.1 2015/04/30 16:12:21 jer Exp $

EAPI=5

DESCRIPTION="Ridiculously functional reminder program"
HOMEPAGE="http://www.roaringpenguin.com/products/remind"
SRC_URI="http://www.roaringpenguin.com/files/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~x86-fbsd"
IUSE="tk"

RDEPEND="tk? ( dev-lang/tk dev-tcltk/tcllib )"

DOCS="docs/WHATSNEW examples/defs.rem www/README.*"

src_prepare() {
	sed -i 's:$(MAKE) install:&-nostripped:' "${S}"/Makefile || die
}

src_test() {
	if [[ ${EUID} -eq 0 ]] ; then
		ewarn "Testing fails if run as root. Skipping tests."
	else
		emake test
	fi
}

src_install() {
	default
	dobin www/rem2html

	if ! use tk ; then
		rm "${D}"/usr/bin/tkremind "${D}"/usr/share/man/man1/tkremind* \
			"${D}"/usr/bin/cm2rem*  "${D}"/usr/share/man/man1/cm2rem*
	fi

	rm "${S}"/contrib/rem2ics-*/{Makefile,rem2ics.spec} || die
	insinto /usr/share/${PN}
	doins -r contrib/
}
