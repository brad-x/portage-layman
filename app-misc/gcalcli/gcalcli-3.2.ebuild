# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/gcalcli/gcalcli-3.2.ebuild,v 1.1 2015/01/11 05:41:32 robbat2 Exp $

EAPI=5
# google-api-python-client only supports these
PYTHON_COMPAT=( python{2_6,2_7} pypy pypy2_0 )

inherit python-r1

DESCRIPTION="Google Calendar Command Line Interface"
HOMEPAGE="https://github.com/insanum/gcalcli"
SRC_URI="https://github.com/insanum/gcalcli/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/python-dateutil
		 dev-python/google-api-python-client
		 dev-python/gdata
		 dev-python/vobject"

src_install() {
	dodoc -r ChangeLog README.md docs
	python_foreach_impl python_doscript ${PN}
}
