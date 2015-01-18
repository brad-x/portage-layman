# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/artikulate/artikulate-4.14.3.ebuild,v 1.2 2014/12/11 12:44:34 zlogene Exp $

EAPI=5

DECLARATIVE_REQUIRED="always"
KDE_HANDBOOK="optional"
inherit kde4-base multilib

DESCRIPTION="Language learning application that helps improving pronunciation skills"
HOMEPAGE="http://edu.kde.org/applications/language/artikulate"
KEYWORDS="amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	dev-qt/qtxmlpatterns:4
	>=media-libs/qt-gstreamer-1.2.0
"
RDEPEND="${DEPEND}
	$(add_kdebase_dep kqtquickcharts)
"
