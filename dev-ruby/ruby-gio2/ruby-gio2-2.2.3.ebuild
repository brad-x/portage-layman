# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-gio2/ruby-gio2-2.2.3.ebuild,v 1.1 2014/12/07 05:51:56 naota Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

inherit ruby-ng-gnome2

DESCRIPTION="Ruby binding of GooCanvas"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND+="dev-libs/gobject-introspection"

ruby_add_rdepend ">=dev-ruby/ruby-glib2-${PV}"
