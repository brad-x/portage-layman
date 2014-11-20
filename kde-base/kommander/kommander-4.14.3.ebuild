# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kommander/kommander-4.14.3.ebuild,v 1.1 2014/11/16 12:21:27 alexxy Exp $

EAPI=5

KDE_HANDBOOK="optional"
KMNAME="kdewebdev"
KDE_SCM="svn"
inherit kde4-meta

DESCRIPTION="KDE dialog system for scripting"
HOMEPAGE="http://www.kde.org/applications/development/kommander/"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"