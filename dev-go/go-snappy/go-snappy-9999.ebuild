# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-go/go-snappy/go-snappy-9999.ebuild,v 1.2 2015/07/30 10:15:41 patrick Exp $

EAPI=5

EGO_SRC=github.com/golang/snappy
EGO_PN=${EGO_SRC}/...

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
else
	KEYWORDS="~amd64"
	EGIT_COMMIT="723cc1e459b8eea2dea4583200fd60757d40097a"
	SRC_URI="https://${EGO_SRC}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
fi
inherit golang-build

DESCRIPTION="The Snappy compression format in the Go programming language."
HOMEPAGE="https://${EGO_SRC}"
LICENSE="BSD"
SLOT="0/${PV}"
IUSE=""
DEPEND=""
RDEPEND=""

if [[ ${PV} != *9999* ]]; then
src_unpack() {
	local f

	for f in ${A}
	do
		case "${f}" in
			*.tar|*.tar.gz|*.tar.bz2|*.tar.xz)
				local destdir=${WORKDIR}/${P}/src/${EGO_SRC}

				debug-print "${FUNCNAME}: unpacking ${f} to ${destdir}"

				# XXX: check whether the directory structure inside is
				# fine? i.e. if the tarball has actually a parent dir.
				mkdir -p "${destdir}" || die
				tar -C "${destdir}" -x --strip-components 1 \
					-f "${DISTDIR}/${f}" || die
				;;
			*)
				debug-print "${FUNCNAME}: falling back to unpack for ${f}"

				# fall back to the default method
				unpack "${f}"
				;;
		esac
	done
}
fi

src_install() {
	rm -rf src/${EGO_SRC}/.git* || die
	golang-build_src_install
}
