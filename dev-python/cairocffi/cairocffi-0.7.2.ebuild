# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/cairocffi/cairocffi-0.7.2.ebuild,v 1.1 2015/08/08 05:29:52 patrick Exp $

EAPI="5"

PYTHON_COMPAT=( python2_7 python3_{3,4} pypy )

inherit distutils-r1

MY_PN="${PN}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="CFFI-based drop-in replacement for Pycairo"
SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"
HOMEPAGE="https://github.com/SimonSapin/cairocffi"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="
	>=dev-python/cffi-1.1.0:=[$(python_gen_usedep 'python*')]
	>=dev-python/xcffib-0.3.2[${PYTHON_USEDEP}]
	x11-libs/cairo:0=
	x11-libs/gdk-pixbuf[jpeg]"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? (
		${RDEPEND}
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

PATCHES=(
	# Intersphinx cause the usual d'loading of objects.inv from TWO online sites
	 "${FILESDIR}"/mapping.patch
	 "${FILESDIR}"/${PN}-0.7.1-test.patch
	 )

S="${WORKDIR}/${MY_P}"

python_compile_all() {
	use doc && esetup.py build_sphinx
}

python_test() {
	py.test -v --pyargs cairocffi || die "testsuite failed under ${EPYTHON}"
}

python_install_all() {
	use doc && HTML_DOCS=( docs/_build/html/. )
	distutils-r1_python_install_all
}
