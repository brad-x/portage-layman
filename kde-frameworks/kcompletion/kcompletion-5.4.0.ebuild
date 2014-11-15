# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-frameworks/kcompletion/kcompletion-5.4.0.ebuild,v 1.1 2014/11/14 11:01:33 mrueg Exp $

EAPI=5

VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework for common completion tasks such as filename or URL completion"
KEYWORDS=" ~amd64"
IUSE="nls"

RDEPEND="
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kwidgetsaddons)
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
"
DEPEND="${RDEPEND}
	nls? ( dev-qt/linguist-tools:5 )
"
