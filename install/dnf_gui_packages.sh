#!/bin/bash
# vim: ts=4:sw=4:expandtab

set -ex

packages=(
    1password
    1password-cli
    code
    kitty
    "@libreoffice"
    virt-manager
    yt-dlp
)

sudo dnf install -y "${packages[@]}"

