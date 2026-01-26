#!/bin/sh
set -e

echo "=== SavarezOS POST-INSTALL ==="

ROOT="/mnt"

# ===============================
# OS RELEASE (REMOVE '12')
# ===============================
cat <<EOF > $ROOT/etc/os-release
PRETTY_NAME="SavarezOS GNU/Linux"
NAME="SavarezOS"
ID=savarezos
ID_LIKE=debian
VERSION_ID="alpha"
LOGO=savarez-logo
EOF

echo "SavarezOS-Alpha" > $ROOT/etc/debian_version
echo "SavarezOS" > $ROOT/etc/hostname

# ===============================
# WALLPAPER (INSTALLED)
# ===============================
WP="$ROOT/usr/share/savarez/savarez-wallpaper.png"

if [ -f "$WP" ]; then
    mkdir -p $ROOT/usr/share/images/desktop-base
    cp -f "$WP" $ROOT/usr/share/images/desktop-base/default.png
    cp -f "$WP" $ROOT/usr/share/images/desktop-base/desktop-background.png
    cp -f "$WP" $ROOT/usr/share/images/desktop-base/login-background.png || true
fi

mkdir -p $ROOT/etc/xdg
cat <<EOF > $ROOT/etc/xdg/plasma-org.kde.plasma.desktop-appletsrc
[Containments][1]
wallpaperplugin=org.kde.image
[Containments][1][Wallpaper][org.kde.image][General]
Image=file:///usr/share/images/desktop-base/default.png
EOF

# ===============================
# ICON & LOGO (INSTALLED)
# ===============================
for size in 16 32 48 64 128 256; do
    mkdir -p $ROOT/usr/share/icons/hicolor/${size}x${size}/apps
    [ -f $ROOT/usr/share/savarez/savarez-logo.svg ] && \
        cp -f $ROOT/usr/share/savarez/savarez-logo.svg \
        $ROOT/usr/share/icons/hicolor/${size}x${size}/apps/savarez-logo.svg
done

chroot $ROOT gtk-update-icon-cache -f /usr/share/icons/hicolor || true

# ===============================
# GRUB THEME
# ===============================
mkdir -p $ROOT/usr/share/grub/themes/SavarezOS
cp -f $ROOT/usr/share/savarez/grub-background.png \
    $ROOT/usr/share/grub/themes/SavarezOS/

cp -f /etc/cal
