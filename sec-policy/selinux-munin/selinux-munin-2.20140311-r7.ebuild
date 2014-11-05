# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-munin/selinux-munin-2.20140311-r7.ebuild,v 1.1 2014/11/01 17:26:14 swift Exp $
EAPI="5"

IUSE=""
MODS="munin"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for munin"

if [[ $PV == 9999* ]] ; then
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86"
fi
DEPEND="${DEPEND}
	sec-policy/selinux-apache
"
RDEPEND="${DEPEND}"
