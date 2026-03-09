#!/bin/bash
# vim: ts=4:sw=4:expandtab

set -ex

compile=(
    cmake
    gcc
    golang
    make
    meson
)

util=(
    bash
    bash-completion
    bat
    bind9-utils
    ca-certificates
    curl
    expect
    fd-find
    fzf
    git
    git-delta
    htop
    jq
    kitty-terminfo
    lsof
    mosh
    neovim
    ripgrep
    rsync
    sysstat
    tmux
    tree
    unzip
    zip
    zsh
)

packages=(
    "${compile[@]}"
    "${util[@]}"
)
sudo apt install -y "${packages[@]}"


bat cache --build

sudo ln -s /usr/bin/fdfind /usr/bin/fd
