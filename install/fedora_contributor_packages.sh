#!/bin/bash
# vim: ts=4:sw=4:expandtab

set -ex

sudo dnf install -y \
    vagrant \
    vagrant-libvirt \
    vagrant-sshfs \
    ansible \
    fedora-packager

