#!/bin/bash

set -ex

sudo dnf install -y \
    bat \
    cmake \
    difftastic \
    fd-find \
    fzf \
    git \
    git-delta \
    gcc \
    golang \
    libvirt \
    meson \
    mosh \
    neovim \
    qemu \
    ripgrep \
    rclone \
    fuse-sshfs \
    tmux \
    zsh


# fedora contributor biz
sudo dnf install -y vagrant vagrant-libvirt vagrant-sshfs ansible fedora-packager


# nvm
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash


# mise
curl https://mise.run | MISE_INSTALL_PATH="${HOME}/.local/bin/mise" sh


# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


# misc
bat cache --build

