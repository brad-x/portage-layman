# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/akonadiconsole/akonadiconsole-4.13.3.ebuild,v 1.3 2014/10/12 13:31:12 zlogene Exp $

EAPI=5

KMNAME="kdepim"
inherit kde4-meta

DESCRIPTION="Akonadi developer console"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	>=app-office/akonadi-server-1.12.1
	$(add_kdebase_dep kdepimlibs)
	$(add_kdebase_dep kdepim-common-libs)
"
RDEPEND="${DEPEND}"

KMEXTRACTONLY="
	akonadi_next/
	calendarsupport/
	messageviewer/
"
