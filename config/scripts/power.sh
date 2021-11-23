#!/bin/sh


choice=$(echo "Shutdown Reboot Lock Logout" | rofi -dmenu -sep " " -theme power)


case $choice in 
    Shutdown) systemctl poweroff;;
    Reboot) kill -15 $(pidof chrome) && reboot;;
    Lock) dm-tool lock;;
    Logout) qtile cmd-obj -o cmd -f shutdown;;
esac