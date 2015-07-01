# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/nomacs/nomacs-2.4.4.ebuild,v 1.1 2015/06/16 00:12:45 pesa Exp $

EAPI=5

inherit cmake-utils fdo-mime

DESCRIPTION="Qt4-based image viewer"
HOMEPAGE="http://www.nomacs.org/"
SRC_URI="mirror://sourceforge/${PN}/${P}-source.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~amd64-linux"
IUSE="opencv raw tiff webp zip"

REQUIRED_USE="
	raw? ( opencv )
	tiff? ( opencv )
"

RDEPEND="
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	>=media-gfx/exiv2-0.20:=[zlib]
	opencv? ( >=media-libs/opencv-2.4:=[qt4] )
	raw? ( >=media-libs/libraw-0.14:= )
	tiff? ( media-libs/tiff:0 )
	webp? ( >=media-libs/libwebp-0.3.1:= )
	zip? ( dev-libs/quazip )
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

src_configure() {
	local mycmakeargs=(
		-DENABLE_QT5=OFF
		$(cmake-utils_use_enable opencv)
		$(cmake-utils_use_enable raw)
		$(cmake-utils_use_enable tiff)
		$(cmake-utils_use_enable webp)
		$(cmake-utils_use_enable zip QUAZIP)
		-DUSE_SYSTEM_WEBP=ON
		-DUSE_SYSTEM_QUAZIP=ON
	)
	cmake-utils_src_configure
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
