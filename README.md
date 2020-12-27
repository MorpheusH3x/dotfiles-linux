# dotfiles-linux


## Gnome Terminal - Select another profile
```
# Grab profile GUID
dconf dump /org/gnome/terminal/legacy/profiles:/ | grep '^\[:\|^visible-name'
# Set profile to a valid GUID
busctl --auto-start=false -j --user call org.gnome.Terminal "/org/gnome/Terminal/window/1" org.gtk.Actions Activate "sava{sv}" "profile" "1" "s" "<ID>" "0"
```
