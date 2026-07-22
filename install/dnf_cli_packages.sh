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

containers=(
    podman
    podman-compose
    podman-docker
)

util=(
    bash
    bat
    bind-utils
    curl
    difftastic
    expect
    fd-find
    fzf
    git
    git-delta
    hdparm
    htop
    jq
    libtree-sitter-devel
    mosh
    neovim
    perf
    ripgrep
    rclone
    rsync
    fuse-sshfs
    tmux
    tree
    tree-sitter-cli
    zsh
)

virt=(
    libvirt
    qemu
)


packages=(
    "${compile[@]}"
    "${containers[@]}"
    "${util[@]}"
    "${virt[@]}"
)
sudo dnf install -y "${packages[@]}"


bat cache --build
