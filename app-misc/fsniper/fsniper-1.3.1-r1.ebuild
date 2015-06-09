# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/fsniper/fsniper-1.3.1-r1.ebuild,v 1.2 2015/06/08 12:49:38 ago Exp $

EAPI=5

inherit autotools-utils

DESCRIPTION="Tool that monitors a given set of directories for new files"
HOMEPAGE="https://github.com/l3ib/fsniper/"
SRC_URI="http://projects.l3ib.org/${PN}/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libpcre
	sys-apps/file"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}"/${P}-format-security.patch
	"${FILESDIR}"/${P}-umask.patch
)
