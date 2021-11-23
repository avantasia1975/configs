#!/bin/sh

~/.screenlayout/home.sh&
nm-applet&
compton --config ~/.config/compton.conf&
urxvtd -f&
feh --bg-scale ~/wallpapers/IceCrystals.jpg&
sleep 5s
killall conky
conky -c "~/.config/conky/Gotham" &
