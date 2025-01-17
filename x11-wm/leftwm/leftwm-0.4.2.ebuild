# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.0.2
	anstream@0.3.2
	anstyle-parse@0.2.0
	anstyle-query@1.0.0
	anstyle-wincon@1.0.1
	anstyle@1.0.0
	anyhow@1.0.71
	anymap2@0.13.0
	autocfg@1.1.0
	base64@0.13.1
	bitflags@1.3.2
	block-buffer@0.10.4
	bytes@1.4.0
	cc@1.0.79
	cfg-if@1.0.0
	clap@4.3.4
	clap_builder@4.3.4
	clap_lex@0.5.0
	colorchoice@1.0.0
	const_format@0.2.31
	const_format_proc_macros@0.2.31
	cpufeatures@0.2.8
	crossbeam-channel@0.5.8
	crossbeam-utils@0.8.16
	crypto-common@0.1.6
	digest@0.10.7
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	dirs-sys@0.4.1
	dirs@5.0.1
	doc-comment@0.3.3
	either@1.8.1
	errno-dragonfly@0.1.2
	errno@0.3.1
	fastrand@1.9.0
	futures-channel@0.3.28
	futures-core@0.3.28
	futures-executor@0.3.28
	futures-io@0.3.28
	futures-macro@0.3.28
	futures-sink@0.3.28
	futures-task@0.3.28
	futures-util@0.3.28
	futures@0.3.28
	generic-array@0.14.7
	getrandom@0.2.10
	git-version-macro@0.3.5
	git-version@0.3.5
	hashbrown@0.12.3
	hermit-abi@0.2.6
	hermit-abi@0.3.1
	home@0.5.5
	indexmap@1.9.3
	instant@0.1.12
	io-lifetimes@1.0.11
	is-terminal@0.4.7
	itertools@0.10.5
	itoa@1.0.6
	kstring@2.0.0
	lazy_static@1.4.0
	lefthk-core@0.1.8
	libc@0.2.146
	linux-raw-sys@0.3.8
	liquid-core@0.26.4
	liquid-derive@0.26.4
	liquid-lib@0.26.4
	liquid@0.26.4
	log@0.4.19
	matchers@0.1.0
	memchr@2.5.0
	memoffset@0.6.5
	memoffset@0.7.1
	mio@0.8.8
	nix@0.23.2
	nix@0.26.2
	nu-ansi-term@0.46.0
	num-traits@0.2.15
	num_cpus@1.15.0
	num_threads@0.1.6
	once_cell@1.18.0
	option-ext@0.2.0
	overload@0.1.1
	percent-encoding@2.3.0
	pest@2.6.0
	pest_derive@2.6.0
	pest_generator@2.6.0
	pest_meta@2.6.0
	pin-project-lite@0.2.9
	pin-utils@0.1.0
	pkg-config@0.3.27
	proc-macro-hack@0.5.20+deprecated
	proc-macro2@1.0.60
	quote@1.0.28
	redox_syscall@0.2.16
	redox_syscall@0.3.5
	redox_users@0.4.3
	regex-automata@0.1.10
	regex-syntax@0.6.29
	regex-syntax@0.7.2
	regex@1.8.4
	ron@0.8.0
	rustix@0.37.20
	ryu@1.0.13
	serde@1.0.164
	serde_derive@1.0.164
	serde_json@1.0.97
	serde_spanned@0.6.2
	sha2@0.10.7
	sharded-slab@0.1.4
	shellexpand@3.1.0
	signal-hook-registry@1.4.1
	signal-hook@0.3.15
	slab@0.4.8
	smallvec@1.10.0
	socket2@0.4.9
	static_assertions@1.1.0
	strsim@0.10.0
	syn@1.0.109
	syn@2.0.18
	syslog-tracing@0.1.0
	tempfile@3.6.0
	thiserror-impl@1.0.40
	thiserror@1.0.40
	thread_local@1.1.7
	time-core@0.1.1
	time-macros@0.2.9
	time@0.3.22
	tokio-macros@2.1.0
	tokio@1.28.2
	toml@0.7.4
	toml_datetime@0.6.2
	toml_edit@0.19.10
	tracing-appender@0.2.2
	tracing-attributes@0.1.24
	tracing-core@0.1.31
	tracing-journald@0.3.0
	tracing-log@0.1.3
	tracing-subscriber@0.3.17
	tracing@0.1.37
	typenum@1.16.0
	ucd-trie@0.1.5
	unicode-ident@1.0.9
	unicode-segmentation@1.10.1
	unicode-xid@0.2.4
	utf8parse@0.2.1
	valuable@0.1.0
	version_check@0.9.4
	wasi@0.11.0+wasi-snapshot-preview1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-targets@0.48.0
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.48.0
	winnow@0.4.7
	x11-dl@2.21.0
	xdg@2.5.0
"

inherit cargo xdg-utils desktop

DESCRIPTION="A window manager for Adventurers"
HOMEPAGE="https://github.com/leftwm/leftwm"
SRC_URI="
	https://github.com/leftwm/leftwm/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	BSD-2 BSD MPL-2.0 Unicode-DFS-2016 ZLIB
	|| ( Apache-2.0 Boost-1.0 )
"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+lefthk syslog systemd"

DEPEND="
	x11-libs/libXinerama:0=
	x11-apps/xrandr:0=
	x11-base/xorg-server:0=
"
RDEPEND="${DEPEND}"

QA_FLAGS_IGNORED="usr/bin/.*"

src_configure() {
	local myfeatures=(
		$(usev lefthk)
		$(usex systemd "journald-log" "")
		$(usex syslog "sys-log" "")
	)
	cargo_src_configure --no-default-features
}

src_install() {
	dodoc README.md CHANGELOG
	make_desktop_entry leftwm.desktop /usr/share/xsessions/

	bins="target/$(usex debug debug release)"
	dobin "${bins}"/leftwm{,-worker,-state,-check,-command}
	use lefthk && dobin "${bins}"/lefthk-worker
}

src_test() {
	cargo_src_test
}

pkg_postinst() {
	xdg_desktop_database_update
	elog "Config file format moved to .ron"
	elog "You need update your config file"
	elog "Try leftwm-check --migrate-toml-to-ron"
	elog "or visit https://github.com/leftwm/leftwm/wiki"
}

pkg_postrm() {
	xdg_desktop_database_update
}
