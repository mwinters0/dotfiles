#!/bin/bash
# vim: ts=2:sw=2:expandtab

grep -v checksum \
    "$HOME/.var/app/md.obsidian.Obsidian/config/obsidian/Custom Dictionary.txt" \
    > "$HOME/.config/nvim/dictionary.txt"
