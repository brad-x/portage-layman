# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/puppet-agent/puppet-agent-1.2.2-r2.ebuild,v 1.2 2015/07/29 22:15:01 prometheanfire Exp $

EAPI=5
inherit eutils systemd unpacker

DESCRIPTION="general puppet client utils along with mcollective hiera and facter"
HOMEPAGE="https://puppetlabs.com/"
SRC_BASE="http://apt.puppetlabs.com/pool/wheezy/PC1/${PN:0:1}/${PN}/${PN}_${PV}-1wheezy"
SRC_URI="
		amd64? ( ${SRC_BASE}_amd64.deb )
		x86?   ( ${SRC_BASE}_i386.deb )
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="puppetdb selinux"
RESTRICT="strip"

CDEPEND="!app-admin/puppet
		!app-admin/mcollective
		!dev-ruby/hiera
		!dev-ruby/facter
		!app-emulation/virt-what"

DEPEND="
		${CDEPEND}"
RDEPEND="${CDEPEND}
		sys-apps/dmidecode
		selinux? (
			sys-libs/libselinux[ruby]
			sec-policy/selinux-puppet
		)
		puppetdb? ( >=dev-ruby/puppetdb-termini-3.0.1-r2 )"

S=${WORKDIR}

src_install() {
	# conf.d
	doconfd etc/default/puppet
	doconfd etc/default/mcollective
	# logrotate.d
	insinto /etc/logrotate.d
	doins etc/logrotate.d/mcollective
	# puppet itself
	insinto /etc/puppetlabs
	doins -r etc/puppetlabs/*
	# logdir for systemd
	dodir var/log/puppetlabs/puppet/
	fperms 0750 var/log/puppetlabs/puppet/
	# the rest
	insinto /opt
	doins -r opt/*
	fperms 0750 /opt/puppetlabs/puppet/cache
	# init
	newinitd "${FILESDIR}/puppet.initd" puppet
	newinitd "${FILESDIR}/mcollective.initd" mcollective
	systemd_dounit "${FILESDIR}/puppet.service"
	systemd_dounit "${FILESDIR}/mcollective.service"
	systemd_newtmpfilesd "${FILESDIR}/puppet-agent.conf.tmpfilesd" puppet-agent.conf
	# symlinks
	chmod 0755 -R "${D}/opt/puppetlabs/puppet/bin/"
	chmod 0755 "${D}//opt/puppetlabs/puppet/lib/virt-what/virt-what-cpuid-helper"
	dosym /opt/puppetlabs/bin/facter /usr/bin/facter
	dosym /opt/puppetlabs/bin/hiera /usr/bin/hiera
	dosym /opt/puppetlabs/bin/mco /usr/bin/mco
	dosym /opt/puppetlabs/bin/puppet /usr/bin/puppet
	dosym /opt/puppetlabs/puppet/bin/mcollectived /usr/sbin/mcollectived
	dosym /opt/puppetlabs/puppet/bin/virt-what /usr/bin/virt-what
	dosym /opt/puppetlabs/puppet/bin/augparse /usr/bin/augparse
	dosym /opt/puppetlabs/puppet/bin/augtool /usr/bin/augtool
	dosym /opt/puppetlabs/puppet/bin/extlookup2hiera /usr/bin/extlookup2hiera
}
