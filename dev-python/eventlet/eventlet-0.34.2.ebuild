# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1 pypi

DESCRIPTION="Concurrent networking library for Python"
HOMEPAGE="https://github.com/eventlet/eventlet/
	https://pypi.org/project/eventlet/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/dnspython[${PYTHON_USEDEP}]
	dev-python/greenlet[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	test? (	dev-python/pyopenssl[${PYTHON_USEDEP}] )
"
DEPEND="${RDEPEND}"

distutils_enable_tests pytest

# https://github.com/eventlet/eventlet/issues/821
EPYTEST_DESELECT=(
	tests/greenio_test.py::TestGreenSocket::test_full_duplex
	tests/greenio_test.py::TestGreenSocket::test_invalid_connection
	tests/greenio_test.py::TestGreenSocket::test_nonblocking_accept_mark_as_reopened
)
