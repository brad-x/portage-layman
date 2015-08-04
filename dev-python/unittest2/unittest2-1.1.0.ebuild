# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/unittest2/unittest2-1.1.0.ebuild,v 1.5 2015/07/27 01:35:14 floppym Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 pypy )

inherit distutils-r1

DESCRIPTION="The new features in unittest backported to Python 2.4+"
HOMEPAGE="http://pypi.python.org/pypi/unittest2"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ppc64"
IUSE=""

CDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/linecache2[${PYTHON_USEDEP}]
	>=dev-python/six-1.4[${PYTHON_USEDEP}]
	dev-python/traceback2[${PYTHON_USEDEP}]
"
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

python_prepare_all() {
	local PATCHES=(
		"${FILESDIR}"/remove-argparse-dependence.patch
	)

	distutils-r1_python_prepare_all
}

python_test() {
	"${PYTHON}" -m unittest2 discover || die "tests failed under ${EPYTHON}"
}
