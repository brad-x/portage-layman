# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-portage/grs/grs-9999.ebuild,v 1.2 2015/07/01 10:51:44 blueness Exp $

EAPI="5"

PYTHON_COMPAT=( python{3_3,3_4} pypy )

inherit distutils-r1

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://anongit.gentoo.org/proj/grss.git"
	inherit git-2
else
	SRC_URI="http://dev.gentoo.org/~blueness/${PN}/${P}.tar.bz2"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Suite to build Gentoo Reference Systems"
HOMEPAGE="http://dev.gentoo.org/~blueness/${PN}"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="
	app-arch/tar[xattr]
	app-crypt/md5deep
	dev-libs/libcgroup
	dev-vcs/git
	net-misc/rsync
	sys-apps/portage
	sys-kernel/genkernel"

src_install() {
	distutils-r1_src_install
	echo "CONFIG_PROTECT=\"/etc/grs/systems.conf\"" > "${T}"/20grs
	doenvd "${T}"/20grs
}
