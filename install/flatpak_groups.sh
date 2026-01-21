#!/bin/bash
# vim: ts=4:sw=4:expandtab

comms=(
    "com.discordapp.Discord"
    "com.slack.Slack"
    "eu.betterbird.Betterbird"
    "im.riot.Riot"
    "org.signal.Signal"
)

work_comms=(
    "com.github.IsmaelMartinez.teams_for_linux"
    "us.zoom.Zoom"
)

dev=(
    "com.jgraph.drawio.desktop"
    "com.usebruno.Bruno"
    "com.visualstudio.code"
    "io.dbeaver.DBeaverCommunity"
    "org.sqlitebrowser.sqlitebrowser"
    "re.sonny.Workbench"
)

media=(
    "be.alexandervanhee.gradia"
    "com.mastermindzh.tidal-hifi"
    "com.obsproject.Studio"
    "com.spotify.Client"
    "org.inkscape.Inkscape"
    "org.kde.gwenview"
    "org.kde.krita"
    "org.videolan.VLC"
)

office=(
    "com.calibre_ebook.calibre"
    "md.obsidian.Obsidian"
    "org.libreoffice.LibreOffice"
)

ops=(
    "io.kinvolk.Headlamp"
)

util=(
    "ca.desrt.dconf-editor"
    "com.github.tchx84.Flatseal"
    "io.github.realmazharhussain.GdmSettings"
    "org.gnome.Extensions"
    "org.gnome.dspy"
    "page.tesk.Refine" 
)

web=(
    "com.google.Chrome"
    "com.transmissionbt.Transmission"
    "org.chromium.Chromium"
    "org.torproject.torbrowser-launcher"
)

groups=(comms work_comms dev media office ops util web)

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

