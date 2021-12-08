#!/bin/sh
#
theme=~/.config/rofi/power
choice=$(echo "Shutdown+Reboot+Lock+Logout" | rofi -theme-str "#listview { lines: 4;}" -fixed-num-lines 3 -sep "+" -dmenu -theme $theme)


case $choice in 
    Shutdown) systemctl poweroff;;
    Reboot) kill -15 $(pidof chrome) && reboot;;
    Lock) ~/.config/scripts/lock.sh;; #dm-tool lock;;
    Logout) qtile cmd-obj -o cmd -f shutdown;;
esac
