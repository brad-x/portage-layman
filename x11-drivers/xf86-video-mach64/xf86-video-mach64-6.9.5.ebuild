# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-video-mach64/xf86-video-mach64-6.9.5.ebuild,v 1.1 2015/05/24 03:08:33 mattst88 Exp $

EAPI=5

XORG_DRI="dri"
inherit xorg-2

DESCRIPTION="ATI Mach64 video driver"

KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND=">=x11-base/xorg-server-1.10
	>=x11-libs/libpciaccess-0.12.901"
DEPEND="${RDEPEND}"

pkg_setup() {
	XORG_CONFIGURE_OPTIONS=(
		$(use_enable dri)
	)

	xorg-2_pkg_setup
}