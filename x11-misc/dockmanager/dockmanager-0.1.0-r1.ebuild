# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/dockmanager/dockmanager-0.1.0-r1.ebuild,v 1.1 2014/12/02 22:00:51 pacho Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )
GCONF_DEBUG="no"

inherit gnome2 python-single-r1 vala

DESCRIPTION="dock-independent helper scripts"
HOMEPAGE="https://launchpad.net/dockmanager"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="debug"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	dev-libs/dbus-glib
	dev-libs/glib:2
	x11-libs/gtk+:2
	x11-libs/libdesktop-agnostic
"
DEPEND="${RDEPEND}
	$(vala_depend)
	virtual/pkgconfig
"

src_prepare() {
	rm -f {scripts,metadata}/pidgin_control.* || die
	sed -i -e "/pidgin_control/d" {scripts,metadata}/Makefile.* || die
	gnome2_src_prepare
}

src_configure() {
	gnome2_src_configure \
		$(use_enable debug) \
		$(use_enable !debug release)
}