# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-libs/fortify-headers/fortify-headers-0.4.ebuild,v 1.1 2015/05/15 13:49:19 blueness Exp $

EAPI=5

DESCRIPTION="A standalone implementation of fortify source."
HOMEPAGE="http://git.2f30.org/fortify-headers/"
SRC_URI="http://git.2f30.org/fortify-headers/snapshot/fortify-headers-${PV}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~mips ~ppc ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's|^PREFIX = /usr/local|PREFIX = /usr|g' Makefile
	export DESTDIR="${D}"
}
