# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/snmplib/snmplib-1.2.0.ebuild,v 1.2 2015/04/11 15:57:28 graaff Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_NAME="snmp"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"
RUBY_FAKEGEM_EXTRAINSTALL="data"

inherit ruby-fakegem

IUSE=""

DESCRIPTION="SNMP library implemented in pure Ruby"
HOMEPAGE="http://snmplib.rubyforge.org/"

KEYWORDS="~amd64 ~ppc ~x86"
LICENSE="Ruby"
SLOT="0"

ruby_add_bdepend "test? ( >=dev-ruby/minitest-4:0 )"

all_ruby_prepare() {
	sed -e '2igem "minitest", "~>4.0"' -i test/test_*.rb || die
}

each_ruby_test() {
	${RUBY} -Ilib:test:. -e 'Dir["test/test_*.rb"].each{|f| require f}' || die
}

all_ruby_install() {
	all_fakegem_install

	insinto /usr/share/doc/${PF}
	doins -r examples
}
