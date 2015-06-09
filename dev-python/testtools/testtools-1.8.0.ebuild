# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/testtools/testtools-1.8.0.ebuild,v 1.1 2015/05/27 08:24:42 jlec Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4} )
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Extensions to the Python standard library unit testing framework"
HOMEPAGE="https://github.com/testing-cabal/testtools"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ppc64"
IUSE="doc test"

CDEPEND="
	dev-python/extras[${PYTHON_USEDEP}]
	dev-python/linecache2[${PYTHON_USEDEP}]
	dev-python/mimeparse[${PYTHON_USEDEP}]
	>=dev-python/pbr-0.11[${PYTHON_USEDEP}]
	>=dev-python/unittest2-1.0.0[${PYTHON_USEDEP}]
	dev-python/traceback2[${PYTHON_USEDEP}]
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${CDEPEND}
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"
RDEPEND="${CDEPEND}"

python_compile_all() {
	use doc && emake -C doc html
}

python_test() {
	"${PYTHON}" -m testtools.run testtools.tests.test_suite || die "tests failed under ${EPYTHON}"
}

python_install_all() {
	use doc && HTML_DOCS=( doc/_build/html/. )

	distutils-r1_python_install_all
}
