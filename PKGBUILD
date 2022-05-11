# Maintainer: RenoirTan <renoirtan2005@gmail.com>

_pkgname='acer-facer'
pkgname="${_pkgname}-git"
_reponame='acer-predator-turbo-and-rgb-keyboard-linux-module'
pkgver='r36.e84ab34'
pkgrel=3
pkgdesc='Kernel module and utilities for controlling the RGB keyboard and turbo mode on Acer laptops.'
url="https://github.com/JafarAkhondali/${_reponame}.git"
arch=('x86_64')
license=('GPL')
# This package recompiles facer.ko whenever its corresponding systemd service gets started
# which is why linux-headers, gcc and make are required
depends=('systemd' 'python' 'bash' 'linux-headers' 'kmod'
         'gcc' 'make' 'coreutils' 'util-linux')
optdepends=()
makedepends=('git' 'coreutils')
source=("${_reponame}::git+https://github.com/JafarAkhondali/${_reponame}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_reponame}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # From acer-predator-turbo-and-rgb-keyboard-linux-module/install.sh

    if [[ -f "/sys/bus/wmi/devices/7A4DDFE7-5B5D-40B4-8595-4408E0CC7F56/" ]]; then
        echo "[*] Sorry but your device doesn't have the required WMI module"
        exit 1
    fi
}

build() {
    echo "nothing to do"
}

package() {
    cd ..

    install="acer-facer-git.install"

    for file in ${srcdir}/${_reponame}/* ; do
        if [ -f "$file" ]; then
            echo "installing $file"
            install -D -m755 "$file" "${pkgdir}/opt/turbo-fan/$(basename $file)"
        fi
    done
    for file in ${srcdir}/${_reponame}/src/* ; do
        if [ -f "$file" ]; then
            echo "installing $file"
            install -D -m755 "$file" "${pkgdir}/opt/turbo-fan/src/$(basename $file)"
        fi
    done
    install -D -m755 "facer_rgb" "${pkgdir}/usr/bin/facer_rgb"
    install -D -m755 "acer-facer.service" "${pkgdir}/usr/lib/systemd/system/turbo-fan.service"
    install -D -m755 "${srcdir}/${_reponame}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
