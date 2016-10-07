# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python{3_4,3_5} )

inherit distutils-r1

DESCRIPTION="The FLExible Network Tester"
HOMEPAGE="https://flent.org/"
SRC_URI="https://github.com/tohojo/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+qt4 +plots"

RDEPEND="qt4? ( dev-python/PyQt4[${PYTHON_USEDEP}] )
		plots? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
		net-analyzer/netperf"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
