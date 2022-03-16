# Maintainer: Dominik Schwaiger <domi.schwaiger04@gmail.com>
pkgname=Darch
pkgver=0.1.1
pkgrel=1
epoch=0
pkgdesc="Configuration files, scripts and packages for Darch"
arch=("x86_64")
url="https://github.com/quiode/DARCH"
license=('MIT')
groups=()
depends=('nextcloud-client' 'code' 'github-cli' 'discord' 'thunderbird' 'lutris' 'nvidia-dkms' 'nvidia-utils' 'lib32-nvidia-utils' 'nvidia-settings' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'lib32-mesa' 'vulkan-radeon' 'lib32-vulkan-radeon' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'lib32-mesa' 'vulkan-intel' 'lib32-vulkan-intel' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'steam' 'virtualbox' 'python-pip' 'signal-desktop' 'telegram-desktop' 'qbittorrent' 'converseen' 'inkscape' 'gimp' 'geogebra' 'flatpak')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=darch.install
changelog=
source=("yay.txt" "flatpak.txt" "snap.txt")
noextract=()
sha512sums=("SKIP" "SKIP" "SKIP")
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
	# Installs aur packages
	yay -S -y --noconfirm --nouseask --noprovides --noremovemake --nodiffmenu --nocleanmenu --noeditmenu --noupgrademenu spotify
	yay -S -y --noconfirm --nouseask --noprovides --noremovemake --nodiffmenu --nocleanmenu --noeditmenu --noupgrademenu spotifyd
	yay -S -y --noconfirm --nouseask --noprovides --noremovemake --nodiffmenu --nocleanmenu --noeditmenu --noupgrademenu github-desktop-bin
	yay -S -y --noconfirm --nouseask --noprovides --noremovemake --nodiffmenu --nocleanmenu --noeditmenu --noupgrademenu teams
	yay -S -y --noconfirm --nouseask --noprovides --noremovemake --nodiffmenu --nocleanmenu --noeditmenu --noupgrademenu spotify-tui
	yay -S -y --noconfirm --nouseask --noprovides --noremovemake --nodiffmenu --nocleanmenu --noeditmenu --noupgrademenu joplin-desktop
	yay -S -y --noconfirm --nouseask --noprovides --noremovemake --nodiffmenu --nocleanmenu --noeditmenu --noupgrademenu drawio-desktop
	yay -S -y --noconfirm --nouseask --noprovides --noremovemake --nodiffmenu --nocleanmenu --noeditmenu --noupgrademenu snowflake
	yay -S -y --noconfirm --nouseask --noprovides --noremovemake --nodiffmenu --nocleanmenu --noeditmenu --noupgrademenu write_stylus
	yay -S -y --noconfirm --nouseask --noprovides --noremovemake --nodiffmenu --nocleanmenu --noeditmenu --noupgrademenu zotero

	# add flatpak remote
	sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

	# Installs flatpak packages
	xargs -r -a flatpak.txt flatpak install -y

	# Installs snap packages
	xargs -r -a snap.txt snap install

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
	# bash install.sh
	cd ../
	rm -rf libreoffice
}
