# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/ksaneplugin/ksaneplugin-4.14.3.ebuild,v 1.2 2014/12/11 13:05:56 zlogene Exp $

EAPI=5

inherit kde4-base

DESCRIPTION="SANE Plugin for KDE"
KEYWORDS="amd64 ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep libksane)
"
RDEPEND="${DEPEND}"
