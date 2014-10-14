# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/konsolekalendar/konsolekalendar-4.14.1.ebuild,v 1.3 2014/10/12 13:31:13 zlogene Exp $

EAPI=5

KDE_HANDBOOK="optional"
KMNAME="kdepim"
KMMODULE="console/${PN}"
inherit kde4-meta

DESCRIPTION="A command line interface to KDE calendars"
HOMEPAGE+=" http://userbase.kde.org/KonsoleKalendar"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep kdepimlibs)
	$(add_kdebase_dep kdepim-common-libs)
"
RDEPEND="${DEPEND}"

KMCOMPILEONLY="
	calendarsupport/
"
KMEXTRACTONLY="
	calendarviews/
	libkdepimdbusinterfaces/
"

KMLOADLIBS="kdepim-common-libs"
