#!/bin/bash
# vim: ts=4:sw=4:expandtab

set -ex

# Sanity check
: "${HOME:?[\$HOME isn\'t set]}"
if [[ ! -d "$HOME" ]]; then
    echo "$HOME isn't a directory!"
    exit 1
fi

# check dependencies
for d in curl unzip which; do
    if [ ! "$(which $d)" ]; then
        echo "Can't locate the '$d' binary." >&2
        exit 1
    fi
done

# Init
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)


# Go

mkdir -p "$HOME/tmp" "$HOME/.local/"{bin,share/fonts}

cp -R "$SCRIPT_DIR/home/*" ~/
# TODO: check systemd symlinks for username

"$SCRIPT_DIR/install/dnf_cli_packages.sh"
"$SCRIPT_DIR/install/fedora_contributor_packages.sh"
"$SCRIPT_DIR/install/mise.sh"
"$SCRIPT_DIR/install/rust.sh"
"$SCRIPT_DIR/install/tailscale.sh"
"$SCRIPT_DIR/install/dnf_gui_packages.sh"
"$SCRIPT_DIR/install/literation_mono_nerdfont.sh"
"$SCRIPT_DIR/install/neovide.sh"
"$SCRIPT_DIR/install/fedora_disable_flatpak.sh"
"$SCRIPT_DIR/install/flatpak_groups.sh" all

gsettings set org.gnome.Ptyxis font-name 'LiterationMono Nerd Font Mono 12'

