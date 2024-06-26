# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Pager that works with Openbox and other EWMH compliant window managers"
HOMEPAGE="https://sourceforge.net/projects/sf-xpaint/files/netwmpager/"
SRC_URI="https://downloads.sourceforge.net/sf-xpaint/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc ~ppc64 x86"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXrender
	x11-libs/libXft
	x11-libs/libXdmcp
	x11-libs/libXau
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
	x11-base/xorg-proto
"

src_configure() {
	# econf doesn't work
	tc-export CC
	./configure --prefix=/usr || die
}

src_compile() {
	emake V=2
}
