#!/bin/bash
set -e

echo "[SavarezOS] Post-install branding started"

ROOT="$CALAMARES_ROOT"

# ===============================
# 1. OS Branding (NO VERSION NUMBER)
# ===============================
cat <<EOF >"$ROOT/etc/os-release"
NAME="SavarezOS"
PRETTY_NAME="SavarezOS"
ID=savarezos
VERSION=""
VERSION_ID=""
EOF

echo "SavarezOS" >"$ROOT/etc/hostname"

# ===============================
# 2. KDE Default Wallpaper (INSTALLED)
# ===============================
mkdir -p "$ROOT/etc/xdg"
cat <<EOF >"$ROOT/etc/xdg/plasma-org.kde.plasma.desktop-appletsrc"
[Containments][1][Wallpaper][org.kde.image][General]
Image=file:///usr/share/savarez/savarez-wallpaper.png
EOF

# ===============================
# 3. Neofetch ASCII (CUSTOM)
# ===============================
mkdir -p "$ROOT/etc/neofetch"

cat <<'EOF' >"$ROOT/etc/neofetch/config.conf"
ascii_distro="SavarezOS"
EOF

mkdir -p "$ROOT/etc/neofetch/ascii"

cat <<'EOF' >"$ROOT/etc/neofetch/ascii/SavarezOS"
   ███████╗ █████╗ ██╗   ██╗
   ██╔════╝██╔══██╗██║   ██║
   ███████╗███████║██║   ██║
   ╚════██║██╔══██║╚██╗ ██╔╝
   ███████║██║  ██║ ╚████╔╝
   ╚══════╝╚═╝  ╚═╝  ╚═══╝

          SavarezOS
EOF

# ===============================
# 4. GRUB THEME (VALID)
# ===============================
GRUB_THEME_DIR="$ROOT/boot/grub/themes/SavarezOS"
mkdir -p "$GRUB_THEME_DIR"

cp /usr/share/savarez/grub-background.png "$GRUB_THEME_DIR/background.png"

cat <<EOF >"$GRUB_THEME_DIR/theme.txt"
title-text: "SavarezOS"
title-font: "DejaVu Sans Bold 24"
title-color: "#ffffff"
desktop-image: "background.png"
terminal-font: "DejaVu Sans Mono 16"
EOF

cat <<EOF >"$ROOT/etc/default/grub"
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="SavarezOS"
GRUB_THEME="/boot/grub/themes/SavarezOS/theme.txt"
EOF

# ===============================
# 5. Remove installer shortcut AFTER install
# ===============================
rm -f "$ROOT/home/"*/Desktop/install-savarezos.desktop || true

# ===============================
# 6. Fix black screen (ensure display manager)
# ===============================
ln -sf /lib/systemd/system/sddm.service \
      "$ROOT/etc/systemd/system/display-manager.service"

echo "[SavarezOS] Post-install branding finished"
