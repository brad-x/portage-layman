# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libndp/libndp-1.4.ebuild,v 1.4 2014/11/13 09:27:12 armin76 Exp $

EAPI=5
GCONF_DEBUG="no"

inherit gnome2

DESCRIPTION="Library for Neighbor Discovery Protocol"
HOMEPAGE="http://libndp.org"
SRC_URI="http://libndp.org/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE="debug"

KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~sparc ~x86"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	gnome2_src_configure \
		--disable-static \
		--enable-logging
}
