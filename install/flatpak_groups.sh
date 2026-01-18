#!/bin/bash
# vim: ts=4:sw=4:expandtab

comms=(
    "com.discordapp.Discord"
    "com.slack.Slack"
    "org.signal.Signal"
    "eu.betterbird.Betterbird"
    "im.riot.Riot"
)

work_comms=(
    "com.github.IsmaelMartinez.teams_for_linux"
    "us.zoom.Zoom"
)

dev=(
    "com.jgraph.drawio.desktop"
    "org.sqlitebrowser.sqlitebrowser"
    "io.dbeaver.DBeaverCommunity"
    "com.usebruno.Bruno"
    "re.sonny.Workbench"
    "com.visualstudio.code"
)

media=(
    "org.inkscape.Inkscape"
    "org.kde.krita"
    "com.mastermindzh.tidal-hifi"
    "com.spotify.Client"
    "org.videolan.VLC"
    "com.obsproject.Studio"
)

office=(
    "org.libreoffice.LibreOffice"
    "md.obsidian.Obsidian"
    "com.calibre_ebook.calibre"
)

util=(
    "com.github.tchx84.Flatseal"
    "ca.desrt.dconf-editor"
    "org.gnome.dspy"
)

web=(
    "com.google.Chrome"
    "org.chromium.Chromium"
    "org.torproject.torbrowser-launcher"
)

groups=(comms work_comms dev media office util web)

usage() {
    echo "Usage: $0 <group1> [group2] [group3] ..."
    echo ""
    echo "Available groups:"
    for group in "${groups[@]}"; do
        echo " - $group"
    done
    echo " - all"
    echo ""
    echo "Example: $0 dev office"
    exit 1
}

# Parse input

if [[ $# -eq 0 ]]; then
    # no args
    usage
fi

input=("$@")
if [[ "$1" == "all" ]]; then
    input=("${groups[@]}")
fi

# Go

packages_to_install=()
for group in "${input[@]}"; do
    valid=false
    for valid_group in "${groups[@]}"; do
        if [ "$group" == "$valid_group" ]; then
            valid=true
            break
        fi
    done
    if [ "$valid" = true ]; then
        # Use nameref to reference the array by name
        declare -n group_packages="$group"
        packages_to_install+=("${group_packages[@]}")
    else
        echo "Error: Unknown group '$group'"
        echo ""
        usage
    fi
done

echo "Calling sudo flatpak install ..."
sudo flatpak install "${packages_to_install[@]}"

