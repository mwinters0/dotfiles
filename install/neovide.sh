#!/bin/bash
# vim: ts=4:sw=4:expandtab

set -ex

mkdir -p ~/.local/bin/

curl -L 'https://github.com/neovide/neovide/releases/latest/download/neovide-linux-x86_64.tar.gz' | tar xzf - -C ~/.local/bin neovide
