# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-vim/rust-mode/rust-mode-9999.ebuild,v 1.1 2014/10/18 12:43:35 jauhien Exp $

EAPI="5"

inherit vim-plugin git-r3

DESCRIPTION="Rust mode for vim"
HOMEPAGE="http://www.rust-lang.org/"
EGIT_REPO_URI="git://github.com/rust-lang/rust.git"

LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS=""

DEPEND="!!<=app-admin/eselect-rust-0.1_pre20140820
	!<=dev-lang/rust-0.11.0-r1:0.11
	!<=dev-lang/rust-999:nightly
	!<=dev-lang/rust-9999-r2:git
"

S="${S}/src/etc/vim"
