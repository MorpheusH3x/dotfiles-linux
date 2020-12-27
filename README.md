# dotfiles-linux


## Gnome Terminal - Select another profile
```
# Grab profile GUID
dconf dump /org/gnome/terminal/legacy/profiles:/ | grep '^\[:\|^visible-name'
# Set profile to a valid GUID
busctl --auto-start=false -j --user call org.gnome.Terminal "/org/gnome/Terminal/window/1" org.gtk.Actions Activate "sava{sv}" "profile" "1" "s" "<ID>" "0"
# List all possible modification
dconf list /org/gnome/terminal/legacy/profiles:/:<ID>/
# Changing background color i.e in blue here
dconf write /org/gnome/terminal/legacy/profiles:/:<ID>/background-color "'rgb(0,0,255)'"
```
