# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/rust/rust-0.11.0-r2.ebuild,v 1.1 2014/10/18 12:48:43 jauhien Exp $

EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7} )

inherit eutils python-any-r1

DESCRIPTION="Systems programming language from Mozilla"
HOMEPAGE="http://www.rust-lang.org/"

ARCH_SRC_URI="amd64? ( http://static.rust-lang.org/dist/${P}-x86_64-unknown-linux-gnu.tar.gz )
	x86? ( http://static.rust-lang.org/dist/${P}-i686-unknown-linux-gnu.tar.gz )"

SRC_URI="http://static.rust-lang.org/dist/${P}.tar.gz ${ARCH_SRC_URI}"

LICENSE="|| ( MIT Apache-2.0 ) BSD-1 BSD-2 BSD-4 UoI-NCSA"
SLOT="0.11"
KEYWORDS="~amd64 ~x86"

IUSE="clang debug emacs libcxx vim-syntax zsh-completion"
REQUIRED_USE="libcxx? ( clang )"

CDEPEND="libcxx? ( sys-libs/libcxx )
	>=app-admin/eselect-rust-0.2_pre20141011
	!dev-lang/rust:0
"
DEPEND="${CDEPEND}
	${PYTHON_DEPS}
	>=dev-lang/perl-5.0
	clang? ( sys-devel/clang )
"
RDEPEND="${CDEPEND}
	emacs? ( >=app-emacs/rust-mode-${PV} )
	vim-syntax? ( >=app-vim/rust-mode-${PV} )
	zsh-completion? ( >=app-shells/rust-zshcomp-${PV} )
"

src_prepare() {
	epatch "${FILESDIR}/${P}-stage0.patch" "${FILESDIR}/${P}-libdir.patch"
}

src_configure() {
	use amd64 && ARCH_POSTFIX="x86_64"
	use x86 && ARCH_POSTFIX="i686"
	LOCAL_RUST_PATH="${WORKDIR}/${P}-${ARCH_POSTFIX}-unknown-linux-gnu"

	"${ECONF_SOURCE:-.}"/configure \
		--prefix="${EPREFIX}/usr" \
		--libdir="${EPREFIX}/usr/lib/${P}" \
		--mandir="${EPREFIX}/usr/share/${P}/man" \
		$(use_enable clang) \
		$(use_enable debug) \
		$(use_enable debug llvm-assertions) \
		$(use_enable !debug optimize) \
		$(use_enable !debug optimize-cxx) \
		$(use_enable !debug optimize-llvm) \
		$(use_enable !debug optimize-tests) \
		$(use_enable libcxx libcpp) \
		--enable-local-rust \
		--local-rust-root="${LOCAL_RUST_PATH}" \
		--disable-manage-submodules \
		--disable-verify-install \
		|| die
}

src_compile() {
	emake VERBOSE=1
}

src_install() {
	default

	mv "${D}/usr/bin/rustc" "${D}/usr/bin/rustc-${PV}" || die
	mv "${D}/usr/bin/rustdoc" "${D}/usr/bin/rustdoc-${PV}" || die

	cat <<-EOF > "${T}"/50${P}
	LDPATH="/usr/lib/${P}"
	MANPATH="/usr/share/${P}/man"
	EOF
	doenvd "${T}"/50${P}

	dodir /etc/env.d/rust
	touch "${D}/etc/env.d/rust/provider-${P}" || die
}

pkg_postinst() {
	eselect rust update --if-unset

	elog "Rust uses slots now, use 'eselect rust list'"
	elog "and 'eselect rust set' to list and set rust version."
	elog "For more information see 'eselect rust help'"
	elog "and http://wiki.gentoo.org/wiki/Project:Eselect/User_guide"
}

pkg_postrm() {
	eselect rust unset --if-invalid
}
