# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/gnome-music/gnome-music-3.14.2.ebuild,v 1.1 2014/12/22 23:38:19 eva Exp $

EAPI="5"
GCONF_DEBUG="no"
PYTHON_COMPAT=( python{3_3,3_4} )

inherit gnome2 python-single-r1

DESCRIPTION="Music management for Gnome"
HOMEPAGE="http://wiki.gnome.org/Apps/Music"

LICENSE="GPL-2+"
SLOT="0"
IUSE=""
# Let people emerge this by default, bug #472932
IUSE+=" +python_single_target_python3_3 python_single_target_python3_4"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

KEYWORDS="~amd64 ~x86"

COMMON_DEPEND="
	${PYTHON_DEPS}
	>=dev-libs/glib-2.28:2
	>=dev-libs/gobject-introspection-1.35.9
	>=media-libs/grilo-0.2.6:0.2[introspection]
	media-libs/libmediaart:1.0
	>=x11-libs/gtk+-3.13.2:3[introspection]
"
RDEPEND="${COMMON_DEPEND}
	app-misc/tracker[introspection(+)]
	|| (
		app-misc/tracker[gstreamer]
		app-misc/tracker[ffmpeg]
	)
	dev-python/pygobject:3[cairo,${PYTHON_USEDEP}]
	dev-python/dbus-python[${PYTHON_USEDEP}]
	media-libs/gstreamer:1.0[introspection]
	media-libs/gst-plugins-base:1.0[introspection]
	media-plugins/gst-plugins-meta:1.0
	media-plugins/grilo-plugins:0.2[tracker]
"
DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.26
	virtual/pkgconfig
"

src_configure() {
	gnome2_src_configure ITSTOOL="$(type -P true)"
}

src_install() {
	gnome2_src_install
	python_fix_shebang "${ED}"
}
