# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/artikulate/artikulate-4.13.3.ebuild,v 1.4 2014/10/12 13:31:12 zlogene Exp $

EAPI=5

DECLARATIVE_REQUIRED="always"
KDE_HANDBOOK="optional"
inherit kde4-base multilib

DESCRIPTION="Language learning application that helps improving pronunciation skills"
HOMEPAGE="http://edu.kde.org/applications/language/artikulate"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug gstreamer"

DEPEND="
	dev-qt/qtxmlpatterns:4
	media-libs/phonon
	gstreamer? ( <media-libs/qt-gstreamer-1.0.0 )
	!gstreamer? ( dev-qt/qt-mobility[multimedia] )
"
RDEPEND="${DEPEND}
	$(add_kdebase_dep kqtquickcharts)
"

src_configure() {
	# Paths are required because qt-mobility is installed to custom location
	local mycmakeargs=(
		-DCMAKE_INCLUDE_PATH="${EPREFIX}/usr/include/qt4"
		-DCMAKE_LIBRARY_PATH="${EPREFIX}/usr/$(get_libdir)/qt4"
		$(cmake-utils_use_find_package gstreamer QtGStreamer)
	)

	kde4-base_src_configure
}
