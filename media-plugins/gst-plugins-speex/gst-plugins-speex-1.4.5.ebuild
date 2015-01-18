# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-speex/gst-plugins-speex-1.4.5.ebuild,v 1.1 2014/12/30 21:52:37 leio Exp $

EAPI="5"

GST_ORG_MODULE=gst-plugins-good
inherit gstreamer

DESCRIPTION="GStreamer plugin to allow encoding and decoding of speex"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE=""

RDEPEND=">=media-libs/speex-1.2_rc1-r1[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}"
