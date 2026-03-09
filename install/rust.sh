#!/bin/bash
# vim: ts=4:sw=4:expandtab

set -ex

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


source ~/.cargo/env

# Add `cargo install-update -a` for binaries installed with `cargo install`
# https://github.com/nabijaczleweli/cargo-update
cargo install cargo-update

# Add `cargo outdated`
# https://github.com/kbknapp/cargo-outdated
cargo install cargo-outdated
