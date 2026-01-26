#!/bin/bash
set -e

ROOT=/mnt

echo "== SavarezOS POST-INSTALL BRANDING =="

# OS identity (FIX SavarezOS 12)
cat <<EOF > $ROOT/usr/lib/os-release
NAME="SavarezOS"
PRETTY_NAME="SavarezOS GNU/Linux"
ID=savarezos
ID_LIKE=debian
VERSION_ID="alpha"
LOGO=savarez-logo
EOF

echo "SavarezOS" > $ROOT/etc/hostname

# Wallpaper (installed system)
mkdir -p $ROOT/etc/xdg
cat <<EOF > $ROOT/etc/xdg/plasma-org.kde.plasma.desktop-appletsrc
[Containments][1]
wallpaperplugin=org.kde.image
[Containments][1][Wallpaper][org.kde.image][General]
Image=file:///usr/share/savarez/savarez-wallpaper.png
EOF

# Neofetch
mkdir -p $ROOT/etc/neofetch/ascii
cat <<'EOF' > $ROOT/etc/neofetch/config.conf
ascii_distro="SavarezOS"
EOF

# GRUB theme
mkdir -p $ROOT/usr/share/grub/themes/SavarezOS
cp /usr/share/savarez/grub-background.png \
   $ROOT/usr/share/grub/themes/SavarezOS/background.png

cat <<EOF > $ROOT/usr/share/grub/themes/SavarezOS/theme.txt
title-text: ""
desktop-image: "background.png"
terminal-font: "DejaVu Sans Mono 16"
title-font: "DejaVu Sans 20"
EOF

sed -i 's|^GRUB_THEME=.*|GRUB_THEME="/usr/share/grub/themes/SavarezOS/theme.txt"|' \
   $ROOT/etc/default/grub

chroot $ROOT update-grub

echo "== BRANDING DONE =="
