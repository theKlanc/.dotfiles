#!/bin/sh
echo "horizontal" > /tmp/monitor_orientation
chmod 777 /tmp/monitor_orientation
xrandr --output DVI-I-0 --off --output DVI-I-1 --off --output HDMI-0 --mode 1920x1080 --pos 3200x0 --rotate normal --output DP-0 --mode 1920x1080 -r 144 --pos 1280x0 --rotate normal --output DP-1 --off --output DVI-D-0 --mode 1280x1024 --pos 0x117 --rotate normal
exit 0
