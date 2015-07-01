# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/mail-client/geary/geary-0.10.0.ebuild,v 1.2 2015/06/27 09:51:16 pacho Exp $

EAPI=5
GCONF_DEBUG="no"
VALA_MIN_API_VERSION=0.22

# Keep cmake-utils at the end
inherit eutils fdo-mime gnome2 vala cmake-utils

DESCRIPTION="A lightweight, easy-to-use, feature-rich email client"
HOMEPAGE="https://wiki.gnome.org/Apps/Geary"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

DEPEND="
	>=app-crypt/gcr-3.10.1[gtk,introspection,vala]
	app-crypt/libsecret
	dev-db/sqlite:3
	dev-libs/glib:2
	>=dev-libs/libgee-0.8.5:0.8
	dev-libs/libxml2:2
	dev-libs/gmime:2.6
	media-libs/libcanberra
	>=net-libs/webkit-gtk-1.10.0:3[introspection]
	>=x11-libs/gtk+-3.10.0:3[introspection]
	x11-libs/libnotify
"
RDEPEND="${DEPEND}
	gnome-base/gsettings-desktop-schemas
	nls? ( virtual/libintl )
"
DEPEND="${DEPEND}
	app-text/gnome-doc-utils
	dev-util/desktop-file-utils
	nls? ( sys-devel/gettext )
	$(vala_depend)
	virtual/pkgconfig
"

DOCS=( AUTHORS MAINTAINERS README NEWS THANKS )

src_prepare() {
	# https://bugzilla.gnome.org/show_bug.cgi?id=751556
	epatch "${FILESDIR}"/${PN}-0.7.2-cflags.patch

	# https://bugzilla.gnome.org/show_bug.cgi?id=751557
	epatch "${FILESDIR}"/${PN}-0.5.3-vapigen.patch

	# https://bugzilla.gnome.org/show_bug.cgi?id=751558
	epatch "${FILESDIR}"/${PN}-0.6.0-desktopfile.patch

	local i
	if use nls ; then
		if [[ -n "${LINGUAS+x}" ]] ; then
			for i in $(cd po ; echo *.po) ; do
				if ! has ${i%.po} ${LINGUAS} ; then
					sed -i -e "/^${i%.po}$/d" po/LINGUAS || die
				fi
			done
		fi
	else
		sed -i -e 's#add_subdirectory(po)##' CMakeLists.txt || die
	fi

	cmake-utils_src_prepare
	gnome2_src_prepare
	vala_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DDESKTOP_UPDATE=OFF
		-DGSETTINGS_COMPILE=OFF
		-DICON_UPDATE=OFF
		-DVALA_EXECUTABLE="${VALAC}"
		-DWITH_UNITY=OFF
		-DDESKTOP_VALIDATE=OFF
	)

	cmake-utils_src_configure
}
