# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-apps/kdiamond/kdiamond-4.14.3.ebuild,v 1.1 2015/06/04 18:44:43 kensington Exp $

EAPI=5

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="KDE: KDiamond is a three-in-a-row game"
HOMEPAGE="
	http://www.kde.org/applications/games/kdiamond/
	http://games.kde.org/game.php?game=kdiamond
"
KEYWORDS="amd64 ~arm ppc ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="$(add_kdeapps_dep libkdegames)"
RDEPEND="${DEPEND}"