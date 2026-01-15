#!/bin/bash
# vim: ts=4:sw=4:expandtab

set -e

# Sanity check
: "${HOME:?[\$HOME isn\'t set]}"
if [[ ! -d "$HOME" ]]; then
    echo "$HOME isn't a directory!"
    exit 1
fi

# Init
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)


# We use bash namerefs to pass the arrays.  However, shellcheck _still_ doesn't
# recognize these properly: https://github.com/koalaman/shellcheck/issues/817 ,
# hence the disable=SC2034 below.

function collect_dirs () {
    local base_dir="$1"
    local dst_dir="$2"
    local -n names="$3" # nameref to array

    for n in "${names[@]}"; do
        local src="$base_dir/$n"
        local dst="$dst_dir/"
        if [[ ! -d $src ]]; then
            echo "Skipping (doesn't exist): '$src'..."
            continue
        fi
        rsync -av --del "$src" "$dst"
    done
}

function collect_files () {
    local src_dir="$1"
    local dst_dir="$2"
    local -n names="$3" # nameref to array

    for n in "${names[@]}"; do
        local src="$src_dir/$n"
        local dst="$dst_dir/"
        if [[ ! -f $src ]]; then
            echo "Skipping (doesn't exist): '$src'..."
            continue
        fi
        cp "$src" "$dst"
    done
}


# Run

mkdir -p "$SCRIPT_DIR/home/.config" "$SCRIPT_DIR/home/.local/bin"

# ~
# shellcheck disable=SC2034
home_files=(.gitconfig .zshenvm .zshrcm)
collect_files "$HOME" "$SCRIPT_DIR/home" home_files

# ~/.config
# shellcheck disable=SC2034
config_dirs=(atuin bat hnjobs kitty mise nvim systemd zellij)
collect_dirs "$HOME/.config" "$SCRIPT_DIR/home/.config" config_dirs

# ~/.local/bin
# shellcheck disable=SC2034
bin_files=(dmesg.sh rec lhist.sh set_color_aliases.sh sshmount.sh sshumount.sh tt unset_color_aliases.sh)
collect_files "$HOME/.local/bin" "$SCRIPT_DIR/home/.local/bin" bin_files

