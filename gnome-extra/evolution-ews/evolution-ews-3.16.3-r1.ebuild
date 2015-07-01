# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/evolution-ews/evolution-ews-3.16.3-r1.ebuild,v 1.1 2015/06/13 10:44:17 pacho Exp $

EAPI="5"
GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"

inherit autotools eutils gnome2

DESCRIPTION="Evolution module for connecting to Microsoft Exchange Web Services"
HOMEPAGE="https://wiki.gnome.org/Apps/Evolution"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-db/sqlite:3=
	>=dev-libs/glib-2.40:2
	dev-libs/libical:0=
	>=dev-libs/libxml2-2
	>=gnome-extra/evolution-data-server-${PV}:0=
	>=mail-client/evolution-${PV}:2.0
	>=net-libs/libsoup-2.42:2.4
	>=x11-libs/gtk+-3:3
"
DEPEND="${RDEPEND}
	>=dev-util/gtk-doc-am-1.9
	>=dev-util/intltool-0.35.5
	virtual/pkgconfig
	test? ( net-libs/uhttpmock )
"

src_prepare() {
	# Install locales in proper dir (from 'master')
	epatch "${FILESDIR}"/${PN}-3.16.3-localedir.patch
	eautoreconf
}

src_configure() {
	# We don't have libmspack, needing internal lzx
	gnome2_src_configure \
		--with-internal-lzx \
		$(use_enable test tests)
}