# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-plasma/kdecoration/kdecoration-5.3.2.ebuild,v 1.1 2015/06/30 20:50:13 johu Exp $

EAPI=5

KDE_PUNT_BOGUS_DEPS="true"
inherit kde5

DESCRIPTION="Plugin based library to create window decorations"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-qt/qtgui:5"
RDEPEND="${DEPEND}"
