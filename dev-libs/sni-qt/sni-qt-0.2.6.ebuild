# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/sni-qt/sni-qt-0.2.6.ebuild,v 1.1 2014/10/15 17:32:48 mrueg Exp $

EAPI=5

inherit cmake-utils

DESCRIPTION="A Qt plugin which turns all QSystemTrayIcon into StatusNotifierItems"
HOMEPAGE="https://launchpad.net/sni-qt"
SRC_URI="https://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.bz2"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-libs/libdbusmenu-qt[qt4(+)]
	dev-qt/qtcore:4
	dev-qt/qtdbus:4
	dev-qt/qtgui:4
"
RDEPEND="${DEPEND}"
