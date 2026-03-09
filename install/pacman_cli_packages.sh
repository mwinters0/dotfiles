#!/bin/bash
# vim: ts=4:sw=4:expandtab

set -ex

compile=(
    cmake
    gcc
    go
    llvm
    make
    meson
)

util=(
    bash
    bash-completion
    bat
    bind
    btrfs-progs
    ca-certificates
    curl
    dmidecode
    ethtool
    expect
    fail2ban
    fd
    fdupes
    ffmpeg
    fzf
    git
    git-delta
    grub-btrfs
    htop
    iptables-nft
    jq
    kitty-terminfo
    libvirt
    libvirt-dbus
    lsof
    mosh
    neovim
    pacman-contrib
    python-uv
    qemu-base
    rclone
    restic
    ripgrep
    rsync
    socat
    strace
    sudo
    sysstat
    time
    tmux
    tree
    unzip
    wget
    which
    zip
    zsh
)

packages=(
    "${compile[@]}"
    "${util[@]}"
)
sudo pacman -S "${packages[@]}"


bat cache --build
