#!/bin/sh
echo "vertical" > /tmp/monitor_orientation
#xrandr --output DVI-I-0 --off --output DVI-I-1 --off --output HDMI-0 --mode 1920x1080 --pos 2360x560 --rotate normal --output DP-0 --primary --mode 1920x1080 -r 144 --pos 1280x0 --rotate right --output DP-1 --off --output HDMI-1 --mode 1280x1024 --pos 0x610 --rotate normal
xrandr --output HDMI-0 --mode 1920x1080 --rate 119.98 --pos 0x2593 --rotate normal --output DP-0 --primary --mode 2560x1440 --rate 164.85  --pos 1920x1280 --rotate right --output DP-1 --off --output HDMI-1 --off --output DP-2 --mode 3840x2160 --rate 60.00 --pos 3360x0 --rotate right --output DP-3 --off
