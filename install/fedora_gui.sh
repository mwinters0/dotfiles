#!/bin/bash

set -ex

sudo dnf install -y kitty

sudo flatpak remote-modify fedora --disable
sudo flatpak remote-modify fedora-testing --disable

sudo flatpak install -y \
	ca.desrt.dconf-editor \
	com.discordapp.Discord  \
	com.github.IsmaelMartinez.teams_for_linux \
	com.github.tchx84.Flatseal \
	com.google.Chrome \
	com.jgraph.drawio.desktop \
	com.mastermindzh.tidal-hifi \
    com.obsproject.Studio \
	com.slack.Slack \
	com.spotify.Client \
	com.usebruno.Bruno \
	dev.zed.Zed \
	eu.betterbird.Betterbird \
	im.riot.Riot \
    io.dbeaver.DBeaverCommunity \
	md.obsidian.Obsidian \
	org.chromium.Chromium \
	org.gnome.dspy \
    org.inkscape.Inkscape \
    org.kde.krita \
	org.libreoffice.LibreOffice \
	org.signal.Signal \
	org.sqlitebrowser.sqlitebrowser \
	org.torproject.torbrowser-launcher \
	org.videolan.VLC \
	re.sonny.Workbench \
    us.zoom.Zoom

# font install is in .chezmoiexternal.toml
gsettings set org.gnome.Ptyxis font-name 'LiterationMono Nerd Font Mono 12'
