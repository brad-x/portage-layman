# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-frameworks/kservice/kservice-5.4.0.ebuild,v 1.1 2014/11/14 11:01:34 mrueg Exp $

EAPI=5

inherit kde5

DESCRIPTION="Framework providing advanced features for plugins, such as file type association and locating"
LICENSE="LGPL-2 LGPL-2.1+"
KEYWORDS=" ~amd64"
IUSE=""

RDEPEND="
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	dev-qt/qtdbus:5
	dev-qt/qtxml:5
"
DEPEND="${RDEPEND}
	$(add_frameworks_dep kdoctools)
	test? ( dev-qt/qtconcurrent:5 )
"

# requires running kde environment
RESTRICT="test"
