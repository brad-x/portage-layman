# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-plugins/freshplayerplugin/freshplayerplugin-0.2.4.ebuild,v 1.1 2015/04/27 00:44:13 grknight Exp $

EAPI=5

CMAKE_MIN_VERSION="2.8.8"

inherit cmake-utils multilib

LICENSE="MIT"
HOMEPAGE="https://github.com/i-rinat/freshplayerplugin"
DESCRIPTION="PPAPI-host NPAPI-plugin adapter for flashplayer in npapi based browsers"
SRC_URI="https://github.com/i-rinat/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SLOT=0
IUSE="gtk3 jack pulseaudio"

KEYWORDS="~amd64 ~x86"

CDEPEND="
	dev-libs/glib:2=
	dev-libs/libconfig:=
	dev-libs/libevent:=[threads]
	dev-libs/openssl:0=
	media-libs/alsa-lib:=
	media-libs/freetype:2=
	media-libs/mesa:=[egl,gles2]
	x11-libs/libXrandr:=
	x11-libs/libXrender:=
	x11-libs/pango:=[X]
	jack? ( media-sound/jack )
	pulseaudio? ( media-sound/pulseaudio )
	!gtk3? ( x11-libs/gtk+:2= )
	gtk3? ( x11-libs/gtk+:3= )
"

DEPEND="${CDEPEND}
	dev-util/ragel
	virtual/pkgconfig
	"
RDEPEND="${CDEPEND}
	|| (
		www-plugins/chrome-binary-plugins[flash]
		www-client/google-chrome
		www-client/google-chrome-beta
		www-client/google-chrome-unstable
	)
	"

PATCHES=( "${FILESDIR}/${PV}-cmake.patch" )

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with jack JACK)
		$(cmake-utils_use_with pulseaudio PULSEAUDIO)
		-DWITH_GTK=$(usex gtk3 3 2)
		-DCMAKE_SKIP_RPATH=1
	)
	cmake-utils_src_configure
}

src_install() {
	dodoc ChangeLog data/freshwrapper.conf.example README.md
	exeinto /usr/$(get_libdir)/nsbrowser/plugins
	doexe "${BUILD_DIR}/libfreshwrapper-pepperflash.so"
}
