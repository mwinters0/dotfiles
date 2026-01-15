#!/bin/bash
# vim: ts=4:sw=4:expandtab

# Environment validation / setup is in /install.sh

set -ex

curl -L \
    'https://github.com/ryanoasis/nerd-fonts/releases/latest/download/LiberationMono.zip' \
    -o /tmp/LiberationMono.zip

unzip /tmp/LiberationMono.zip '*.ttf' -d "$HOME/.local/fonts/"

rm /tmp/LiberationMono.zip
