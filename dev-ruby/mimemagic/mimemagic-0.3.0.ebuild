# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mimemagic/mimemagic-0.3.0.ebuild,v 1.1 2015/04/09 05:42:12 graaff Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Fast mime detection by extension or content"
HOMEPAGE="https://github.com/minad/mimemagic"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/bacon )"

each_ruby_test() {
	${RUBY} -S bacon -q -Ilib:test test/*_test.rb || die
}
