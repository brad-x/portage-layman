# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/PEAR-VersionControl_SVN/PEAR-VersionControl_SVN-0.5.2.ebuild,v 1.1 2014/11/07 14:35:17 grknight Exp $

EAPI=5

inherit php-pear-r1

DESCRIPTION="Simple OO wrapper interface for the Subversion command-line client"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""
RDEPEND=""

src_prepare() {
	einfo "Patching SVN.php and SVN/Command.php to use proper paths by default"
	sed -i -e 's:/usr/local:/usr:g' VersionControl/SVN.php || die "sed failed"
	sed -i -e 's:/usr/local:/usr:g' VersionControl/SVN/Command.php || die "sed failed"
}
