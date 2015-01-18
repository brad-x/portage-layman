# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/IO-Tty/IO-Tty-1.120.0.ebuild,v 1.3 2015/01/13 17:37:52 jer Exp $

EAPI=5

MODULE_AUTHOR=TODDR
MODULE_VERSION=1.12
inherit perl-module

DESCRIPTION="IO::Tty and IO::Pty modules for Perl"

SLOT="0"
KEYWORDS="~alpha amd64 ~arm hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE=""

SRC_TEST=do
