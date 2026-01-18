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
    bat
    bind-utils
    difftastic
    expect
    fd-find
    fzf
    git
    git-delta
    htop
    libvirt
    mosh
    neovim
    perf
    podman
    podman-compose
    podman-docker
    qemu
    ripgrep
    rclone
    rsync
    fuse-sshfs
    tmux
    tree
    zsh
)

packages=(
    "${compile[@]}"
    "${util[@]}"
)
sudo dnf install -y "${packages[@]}"


bat cache --build

