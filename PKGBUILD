# Maintainer: Dominik Schwaiger <domi.schwaiger04@gmail.com>
pkgname=Darch
pkgver=1.0.6
pkgrel=1
epoch=0
pkgdesc="Configuration files, scripts and packages for Darch"
arch=("x86_64")
url="https://github.com/quiode/DARCH"
license=('MIT')
groups=()
depends=('nextcloud-client' 'code' 'github-cli' 'discord' 'thunderbird' 'lutris' 'nvidia-dkms' 'nvidia-utils' 'lib32-nvidia-utils' 'nvidia-settings' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'lib32-mesa' 'vulkan-radeon' 'lib32-vulkan-radeon' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'lib32-mesa' 'vulkan-intel' 'lib32-vulkan-intel' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'steam' 'virtualbox' 'python-pip' 'signal-desktop' 'telegram-desktop' 'qbittorrent' 'converseen' 'inkscape' 'gimp' 'geogebra' 'flatpak' 'bitwarden' 'gparted')
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
source=("yay.txt" "flatpak.txt" "snap.txt" "DARCH")
noextract=()
sha512sums=("SKIP" "SKIP" "SKIP" "SKIP")
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
	if ! command -v snap &>/dev/null; then
		echo "snap could not be found"
		exit
	fi
}

package() {
	cd $srcdir
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/darch"
	cp -a $srcdir/DARCH "$pkgdir/usr/bin/"
	chmod +x "$pkgdir/usr/bin/DARCH"
	cp -a $srcdir/yay.txt "$pkgdir/usr/share/darch/"
	cp -a $srcdir/flatpak.txt "$pkgdir/usr/share/darch/"
	cp -a $srcdir/snap.txt "$pkgdir/usr/share/darch/"
	echo -e "\033[0;31mUse command DARCH to finish the install!"
}
