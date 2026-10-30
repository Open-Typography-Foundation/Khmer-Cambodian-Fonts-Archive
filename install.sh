#!/usr/bin/env bash
# Open Typography Foundation - Khmer (Cambodian / Angkor) Font Installer
set -e

DEST_DIR="$HOME/.local/share/fonts/opentypography/Khmer-Cambodian-Fonts-Archive"
if [[ "$OSTYPE" == "darwin"* ]]; then
  DEST_DIR="$HOME/Library/Fonts/Khmer-Cambodian-Fonts-Archive"
fi

mkdir -p "$DEST_DIR"
echo "Installing 200+ Khmer (Cambodian / Angkor) fonts to $DEST_DIR..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
find "$SCRIPT_DIR" -maxdepth 1 -type f \( -name "*.ttf" -o -name "*.otf" \) -exec cp -v {} "$DEST_DIR/" \;

if command -v fc-cache >/dev/null 2>&1; then
  fc-cache -fv "$DEST_DIR"
fi

echo "Successfully installed Khmer (Cambodian / Angkor) fonts!"
