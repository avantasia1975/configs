#!/bin/sh

max=$(cat /sys/class/backlight/acpi_video0/max_brightness)
actual=$(cat /sys/class/backlight/acpi_video0/actual_brightness)
steps=$(echo "$max / 10" | bc)

echo $actual
echo $max
echo $steps
if [ $1 == "up" ] ;then
    if [ $actual -ge $max ];then
        notify-send "maxbright"
    else
	value=$(echo "$actual + $steps" | bc)
	if [ $value -gt $max ];then value=$max;fi
	echo $value
        echo $value > /sys/class/backlight/acpi_video0/brightness
    fi	
else
    if [ $actual -eq 0 ];then
        echo "0"
    else 
	value=$(echo "$actual - $steps" | bc)
	echo $value
        echo $value > /sys/class/backlight/acpi_video0/brightness
    fi
fi
echo $value
#echo $value > /sys/class/backlight/acpi_video0/brightness
