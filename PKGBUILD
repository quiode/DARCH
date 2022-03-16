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
depends=('nextcloud-client' 'code' 'github-cli' 'discord' 'thunderbird' 'lutris' 'nvidia-dkms' 'nvidia-utils' 'lib32-nvidia-utils' 'nvidia-settings' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'lib32-mesa' 'vulkan-radeon' 'lib32-vulkan-radeon' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'lib32-mesa' 'vulkan-intel' 'lib32-vulkan-intel' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'steam' 'virtualbox' 'python-pip' 'signal-desktop' 'telegram-desktop' 'qbittorrent' 'converseen' 'inkscape' 'gimp' 'geogebra')
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
sha512sums=("dd64639ae6c45f9cb6fe0b6b3707fac8efa1ca44108bcf345e1c7588d05aae6a1da79b02ca42f1623fb77ce929979ab3a7d7700662c261df125ee5e72d711b9b")
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
	# Installs aur packages
	xargs -a yay.txt yay -S --noconfirm

	# Teams fix (https://aur.archlinux.org/packages/teams)
	mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/applications"
	cp -a "/usr/share/applications/teams.desktop" \
		"${XDG_DATA_HOME:-$HOME/.local/share}/applications/teams.desktop"
	sed -i -e 's,teams %U,teams --disable-seccomp-filter-sandbox %U,' \
		"${XDG_DATA_HOME:-$HOME/.local/share}/applications/teams.desktop"

	# qBittorrent theme
	wget https://github.com/dracula/qbittorrent/raw/master/qbittorrent.qbtheme
	if [ ! -d "/home/$USER/.config/qBittorrent" ]; then
		mkdir -p /home/"$USER"/.config/qBittorrent
	fi
	mv qbittorrent.qbtheme /home/"$USER"/.config/qBittorrent/

	# LibreOffice Theme
	git clone https://github.com/dracula/libreoffice.git
	cd libreoffice || exit
	if [ ! -d "/home/"$USER"/.config/libreoffice/4/user/config/" ]; then
		mkdir -p /home/"$USER"/.config/libreoffice/4/user/config/
	fi
	cp dracula.soc /home/"$USER"/.config/libreoffice/4/user/config/
	bash install.sh
	cd ../
	rm -rf libreoffice
}
