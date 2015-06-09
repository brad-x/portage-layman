# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/batik/batik-1.8.ebuild,v 1.1 2015/06/07 23:38:39 monsieurp Exp $

EAPI=5
JAVA_PKG_IUSE="doc"

inherit java-pkg-2 java-ant-2 eutils

DESCRIPTION="Java based SVG toolkit"
HOMEPAGE="https://xmlgraphics.apache.org/batik/"
SRC_URI="http://apache.mirrors.ovh.net/ftp.apache.org/dist/xmlgraphics/${PN}/source/${PN}-src-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="1.8"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE="doc python tcl"

CDEPEND="dev-java/xalan:0
	dev-java/rhino:1.6
	dev-java/xml-commons-external:1.3
	dev-java/xmlgraphics-commons:1.5
	python? ( dev-java/jython:0 )
	tcl? ( dev-java/jacl:0 )
	dev-java/ant-core"
DEPEND=">=virtual/jdk-1.6
	${CDEPEND}"
RDEPEND=">=virtual/jre-1.6
	${CDEPEND}"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_GENTOO_CLASSPATH="xml-commons-external-1.3,xmlgraphics-commons-1.5,xalan,rhino-1.6"

java_prepare() {
	# bug #318323
	for file in build.xml contrib/rasterizertask/build.xml; do
		java-ant_xml-rewrite -f ${file} -c -e javadoc -a failonerror -v no -a maxmemory -v 512m
	done

	cd lib
	rm -v *.jar build/*.jar || die
	use python && java-pkg_jar-from jython
	use tcl && java-pkg_jar-from jacl
}

src_compile() {
	# Fails to build on amd64 without this
	if use amd64 ; then
		export ANT_OPTS="-Xmx1g"
	else
		export ANT_OPTS="-Xmx256m"
	fi

	eant jars all-jar $(use_doc)
	cd contrib/rasterizertask || die
	eant -Dgentoo.classpath="$(java-pkg_getjar ant-core ant.jar):../../classes" jar $(use_doc)
}

src_install() {
	cd ${P}
	# Unversion all jars in ${P}.
	for jar in *.jar; do
		newj="${jar%-*}.jar"
		java-pkg_newjar ${jar} ${newj}
		dosym ${newj} /usr/share/${PN}-${SLOT}/lib/lib/${jar}
	done

	# needed because batik expects this layout:
	# batik.jar lib/*.jar
	# there are hardcoded classpaths in the manifest :(
	dodir /usr/share/${PN}-${SLOT}/lib/lib/

	cd "${S}"
	dodoc README CHANGES
	use doc && java-pkg_dojavadoc ${P}/docs/javadoc

	# pwd fixes bug #116976
	java-pkg_dolauncher batik-${SLOT} --pwd "${EPREFIX}/usr/share/${PN}-${SLOT}/" \
		--main org.apache.batik.apps.svgbrowser.Main

	# To find these lsjar batik-${SLOT} | grep Main.class
	for launcher in ttf2svg slideshow svgpp rasterizer; do
		java-pkg_dolauncher batik-${launcher}-${SLOT} \
			--main org.apache.batik.apps.${launcher}.Main
	done

	# Install and register the ant task.
	java-pkg_dojar contrib/rasterizertask/build/lib/RasterizerTask.jar
	java-pkg_register-ant-task
}
