# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-leechcraft/lc-imgaste/lc-imgaste-9999.ebuild,v 1.1 2013/06/11 14:25:18 maksbotan Exp $

EAPI="5"

inherit leechcraft

DESCRIPTION="The simple image uploader data filter for LeechCraft"

SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}"
RDEPEND="${DEPEND}"