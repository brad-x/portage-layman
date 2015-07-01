# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libgit2/libgit2-9999.ebuild,v 1.1 2015/05/29 05:39:18 mgorny Exp $

EAPI=5

EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
inherit cmake-utils git-r3 multilib

DESCRIPTION="A linkable library for Git"
HOMEPAGE="http://libgit2.github.com/"
SRC_URI=""

LICENSE="GPL-2-with-linking-exception"
SLOT="0/22"
KEYWORDS=""
IUSE="examples gssapi ssh test threads trace"

RDEPEND="
	dev-libs/openssl:0
	sys-libs/zlib
	net-libs/http-parser
	gssapi? ( virtual/krb5 )
	ssh? ( net-libs/libssh2 )
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

DOCS=( AUTHORS CONTRIBUTING.md CONVENTIONS.md README.md )

src_prepare() {
	# skip online tests
	sed -i '/libgit2_clar/s/-ionline/-xonline/' CMakeLists.txt || die

	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DLIB_INSTALL_DIR="${EPREFIX}/usr/$(get_libdir)"
		$(cmake-utils_use_build test CLAR)
		$(cmake-utils_use_enable trace TRACE)
		$(cmake-utils_use_use gssapi GSSAPI)
		$(cmake-utils_use_use ssh SSH)
		$(cmake-utils_use threads THREADSAFE)
	)
	cmake-utils_src_configure
}

src_test() {
	if [[ ${EUID} -eq 0 ]] ; then
		# repo::iterator::fs_preserves_error fails if run as root
		# since root can still access dirs with 0000 perms
		ewarn "Skipping tests: non-root privileges are required for all tests to pass"
	else
		local TEST_VERBOSE=1
		cmake-utils_src_test
	fi
}

src_install() {
	cmake-utils_src_install

	if use examples ; then
		find examples -name .gitignore -delete || die
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}