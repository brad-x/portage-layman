# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/blankslate/blankslate-3.1.3.ebuild,v 1.1 2014/11/10 07:01:48 graaff Exp $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_EXTRADOC="README"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="A base class where almost all of the methods from Object and Kernel have been removed"
HOMEPAGE="https://rubygems.org/gems/blankslate"

IUSE=""
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64"

all_ruby_prepare() {
	# Avoid test failing with rspec 2.x.
	sed -i -e '/cleanliness/,/^  end/ s:^:#:' spec/blankslate_spec.rb || die
}