# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-googletalk/selinux-googletalk-9999.ebuild,v 1.4 2014/11/01 16:13:37 swift Exp $
EAPI="5"

IUSE="alsa"
MODS="googletalk"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for googletalk"

if [[ $PV == 9999* ]] ; then
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86"
fi
