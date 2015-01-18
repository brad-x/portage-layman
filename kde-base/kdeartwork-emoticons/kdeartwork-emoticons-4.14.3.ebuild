# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kdeartwork-emoticons/kdeartwork-emoticons-4.14.3.ebuild,v 1.2 2014/12/11 13:05:45 zlogene Exp $

EAPI=5

RESTRICT="binchecks strip"

KMMODULE="emoticons"
KMNAME="kdeartwork"
KDE_SCM="svn"
inherit kde4-meta

DESCRIPTION="EmotIcons (icons for things like smilies :-) for kde"
KEYWORDS="amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""
