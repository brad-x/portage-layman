# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-qt/qtscript/qtscript-5.4.1.ebuild,v 1.4 2015/05/16 10:52:05 jer Exp $

EAPI=5

inherit qt5-build

DESCRIPTION="Application scripting library for the Qt5 framework"

if [[ ${QT5_BUILD_TYPE} == live ]]; then
	KEYWORDS="~ppc64"
else
	KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~ppc64 ~x86"
fi

IUSE="scripttools"

DEPEND="
	>=dev-qt/qtcore-${PV}:5[debug=]
	scripttools? (
		>=dev-qt/qtgui-${PV}:5[debug=]
		>=dev-qt/qtwidgets-${PV}:5[debug=]
	)
"
RDEPEND="${DEPEND}"

src_prepare() {
	qt_use_disable_mod scripttools widgets \
		src/src.pro

	qt5-build_src_prepare
}
