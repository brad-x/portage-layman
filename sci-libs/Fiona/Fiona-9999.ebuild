# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-libs/Fiona/Fiona-9999.ebuild,v 1.4 2015/01/08 12:50:14 jlec Exp $

EAPI="5"

PYTHON_COMPAT=( python2_7 python3_{3,4} )

inherit distutils-r1 git-r3

DESCRIPTION="Fiona is OGR's neat, nimble, no-nonsense API"
HOMEPAGE="https://pypi.python.org/pypi/Fiona"
SRC_URI=""
EGIT_REPO_URI="http://github.com/Toblerity/${PN}.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="test"

RDEPEND=">=sci-libs/gdal-1.8"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		)
	${PYTHON_DEPS}"

python_test() {
	esetup.py test
}
