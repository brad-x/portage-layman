# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/py2play/py2play-0.1.10-r1.ebuild,v 1.1 2014/12/31 10:29:07 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

MY_P="${P/py2play/Py2Play}"

DESCRIPTION="A Peer To Peer network game engine"
HOMEPAGE="http://home.gna.org/oomadness/en/slune"
SRC_URI="http://download.gna.org/slune/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${MY_P}"
