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
    libtree-sitter-bash
    libtree-sitter-c
    libtree-sitter-c-sharp
    libtree-sitter-cmake
    libtree-sitter-cpp
    libtree-sitter-css
    libtree-sitter-go
    libtree-sitter-html
    libtree-sitter-java
    libtree-sitter-javascript
    libtree-sitter-jsdoc
    libtree-sitter-json
    libtree-sitter-lua
    libtree-sitter-python
    libtree-sitter-ruby
    libtree-sitter-rust
    libtree-sitter-toml
    libtree-sitter-typescript
    libtree-sitter-yaml
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
