# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/tzlocal/tzlocal-1.2.ebuild,v 1.1 2015/06/15 21:54:39 mrueg Exp $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="tzinfo object for the local timezone"
HOMEPAGE="https://github.com/regebro/tzlocal"
SRC_URI="mirror://pypi/t/${PN}/${P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDPEND="dev-python/pytz[${PYTHON_USEDEP}]"

python_test() {
	unset TZ
	"${PYTHON}" -m unittest discover || die "Testing failed with ${EPYTHON}"
}