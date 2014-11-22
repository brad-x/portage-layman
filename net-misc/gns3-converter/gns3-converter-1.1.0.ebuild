# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/gns3-converter/gns3-converter-1.1.0.ebuild,v 1.1 2014/11/22 08:17:39 idella4 Exp $

EAPI="5"

PYTHON_COMPAT=( python{3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Designed to convert old ini-style GNS3 topologies"
HOMEPAGE="https://github.com/dlintott/gns3-converter"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/configobj[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
