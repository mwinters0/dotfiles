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

"$SCRIPT_DIR/install/literation_mono_nerdfont.sh"
"$SCRIPT_DIR/install/fedora_cli.sh"
"$SCRIPT_DIR/install/fedora_gui.sh"

# TODO: copy all files
# TODO: check systemd symlinks for username
