#!/bin/bash
# vim: ts=4:sw=4:expandtab

set -ex

mkdir -p ~/.local/bin

curl https://mise.run | MISE_INSTALL_PATH="${HOME}/.local/bin/mise" sh
