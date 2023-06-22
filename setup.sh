#!/usr/bin/bash

# Update and install various programs
sudo dnf update -y --refresh
# VLC
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm vlc
# Neovim
sudo dnf install -y neovim python3-neovim
sudo dnf autoremove -y
##

# Add terminal shortcut
customShortcuts=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings | grep '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom[0-9]\+/' -o)
numberOfShortcuts=$(echo $customShortcuts | wc -l)
newEntry="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${numberOfCurrentCustomShortcuts}/"

#TODO search if the shortcut already exits
echo $numberOfShortcuts
echo $newEntry
if [ "$numberOfCurrentCustomShortcuts" -gt "0" ]
then
	currentEntries="$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings | sed -e 's/.*\[\(.*\)\].*/\1/')"
#	gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[${currentEntries}, '${newEntry}']"
else		
#	gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['${newEntry}']"
fi 

#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${newEntry} binding '<Control><Alt>t'
#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${newEntry} name 'terminal'
#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${newEntry} command 'gnome-terminal'
##

