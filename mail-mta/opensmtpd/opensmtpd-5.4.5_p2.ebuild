# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/mail-mta/opensmtpd/opensmtpd-5.4.5_p2.ebuild,v 1.1 2015/05/27 12:39:40 zx2c4 Exp $

EAPI=5

inherit multilib user flag-o-matic eutils pam toolchain-funcs autotools systemd versionator

DESCRIPTION="Lightweight but featured SMTP daemon from OpenBSD"
HOMEPAGE="http://www.opensmtpd.org/"
MY_P="${P}"
if [ $(get_last_version_component_index) -eq 4 ]; then
	MY_P="${PN}-$(get_version_component_range 4-)"
fi
SRC_URI="https://www.opensmtpd.org/archives/${MY_P/_}.tar.gz"

LICENSE="ISC BSD BSD-1 BSD-2 BSD-4"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="pam ldap mysql postgres sqlite redis socketmap +mta"

DEPEND="dev-libs/openssl
		sys-libs/zlib
		pam? ( virtual/pam )
		sys-libs/db
		sqlite? ( dev-db/sqlite:3 )
		mysql? ( virtual/mysql )
		postgres? ( dev-db/postgresql )
		redis? ( dev-libs/hiredis )
		dev-libs/libevent
		app-misc/ca-certificates
		net-mail/mailbase
		net-libs/libasr
		!mail-mta/courier
		!mail-mta/esmtp
		!mail-mta/exim
		!mail-mta/mini-qmail
		!mail-mta/msmtp[mta]
		!mail-mta/netqmail
		!mail-mta/nullmailer
		!mail-mta/postfix
		!mail-mta/qmail-ldap
		!mail-mta/sendmail
		!mail-mta/ssmtp[mta]
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P/_}

src_prepare() {
	epatch "${FILESDIR}/${P}-libevent-version-macro.patch"
	epatch "${FILESDIR}/${P}-setgroups-header.patch"
	epatch_user
	eautoreconf
}

src_configure() {
	tc-export AR
	AR="$(which "$AR")" econf \
		--with-privsep-user=smtpd \
		--with-queue-user=smtpq \
		--with-privsep-path=/var/empty \
		--with-sock-dir=/var/run \
		--sysconfdir=/etc/opensmtpd \
		--with-ca-file=/etc/ssl/certs/ca-certificates.crt \
		$(use_with ldap experimental-ldap) \
		$(use_with mysql experimental-mysql) \
		$(use_with postgres experimental-postgres) \
		$(use_with sqlite experimental-sqlite) \
		$(use_with redis experimental-redis) \
		$(use_with socketmap experimental-socketmap) \
		$(use_with pam)
}

src_install() {
	default
	newinitd "${FILESDIR}"/smtpd.initd smtpd
	systemd_dounit "${FILESDIR}"/smtpd.{service,socket}
	use pam && newpamd "${FILESDIR}"/smtpd.pam smtpd
	if use mta ; then
		dodir /usr/sbin
		dosym /usr/sbin/smtpctl /usr/sbin/sendmail
		dosym /usr/sbin/smtpctl /usr/bin/sendmail
		dosym /usr/sbin/smtpctl /usr/$(get_libdir)/sendmail
	fi
}

pkg_preinst() {
	enewgroup smtpd 25
	enewuser smtpd 25 -1 /var/empty smtpd
	enewgroup smtpq 252
	enewuser smtpq 252 -1 /var/empty smtpq
}
