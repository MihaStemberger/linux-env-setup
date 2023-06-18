#!/usr/bin/bash

sudo dnf update -y --refresh
sudo dnf autoremove -y

# terminal shortcut
customShortcuts=$(gsettings get org.gnome.settings.daemon.plugins.media-keys custom-keybindings | grep '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom[0-9]\+/' -o)
numberOfShortcuts=$(echo $customShortcuts | wc -l)
newEntry="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${numberOfCurrentCustomShortcuts}/"


#TODO search if the shortcut already exits
echo $numberOfCurrentCustomShortcuts
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

