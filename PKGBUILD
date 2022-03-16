# Maintainer: Dominik Schwaiger <domi.schwaiger04@gmail.com>
pkgname=Darch
pkgver=0.1
pkgrel=1
epoch=0
pkgdesc="Configuration files, scripts and packages for Darch"
arch=("x86_64")
url="https://github.com/quiode/DARCH"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("yay.txt")
noextract=()
sha512sums=("3d88a9005512ae92789e6a007436ec848c9615e3fd0f150827554cf829632fb6")
validpgpkeys=()

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

# build() {
# 	cd "$pkgname-$pkgver"
# 	./configure --prefix=/usr
# 	make
# }

check() {
	if ! command -v yay &>/dev/null; then
		echo "yay could not be found"
		exit
	fi
}

package() {
	cd "$srcdir" || exit
	xargs -a yay.txt yay -S --noconfirm
}
