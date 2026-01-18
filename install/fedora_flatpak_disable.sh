#!/bin/bash
# vim: ts=4:sw=4:expandtab

# Disable Fedora's flatpak repos

set -ex


sudo flatpak remote-modify fedora --disable
sudo flatpak remote-modify fedora-testing --disable
