# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-frameworks/kitemmodels/kitemmodels-5.4.0.ebuild,v 1.1 2014/11/14 11:01:35 mrueg Exp $

EAPI=5

VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework providing data models that help with tasks such as sorting and filtering"
LICENSE="LGPL-2+"
KEYWORDS=" ~amd64"
IUSE=""

DEPEND="test? ( dev-qt/qtwidgets:5 )"
