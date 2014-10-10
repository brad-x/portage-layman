# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Net-Patricia/Net-Patricia-1.210.0-r1.ebuild,v 1.8 2014/10/09 12:34:47 zlogene Exp $

EAPI=5

MODULE_AUTHOR=GRUBER
MODULE_VERSION=1.21
inherit perl-module toolchain-funcs

DESCRIPTION="Patricia Trie perl module for fast IP address lookups"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc x86 ~x86-fbsd"
IUSE="ipv6"

RDEPEND="dev-perl/Net-CIDR-Lite
	ipv6? (
		dev-perl/Socket6
	)
"
DEPEND="${RDEPEND}"

src_compile() {
	emake AR="$(tc-getAR)" OTHERLDFLAGS="${LDFLAGS}"
}

#SRC_TEST="do"
