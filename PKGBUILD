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
depends=('nextcloud-client' 'code' 'github-cli' 'discord' 'thunderbird' 'lutris' 'nvidia-dkms' 'nvidia-utils' 'lib32-nvidia-utils' 'nvidia-settings' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'lib32-mesa' 'vulkan-radeon' 'lib32-vulkan-radeon' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'lib32-mesa' 'vulkan-intel' 'lib32-vulkan-intel' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'steam' 'virtualbox' 'python-pip' 'signal-desktop' 'telegram-desktop')
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
sha512sums=("d8d85539c65777b2eef08fec98ce271b708432b6d1f510928d04a05e5fd6cea52490fe256d19e442213d9471862ed0b0520d287041ad09c0888e579d8d65c21c")
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
	# Installs aur packages
	xargs -a yay.txt yay -S --noconfirm

	# Teams fix (https://aur.archlinux.org/packages/teams)
	mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/applications"
	cp -a "/usr/share/applications/teams.desktop" \
		"${XDG_DATA_HOME:-$HOME/.local/share}/applications/teams.desktop"
	sed -i -e 's,teams %U,teams --disable-seccomp-filter-sandbox %U,' \
		"${XDG_DATA_HOME:-$HOME/.local/share}/applications/teams.desktop"
}
