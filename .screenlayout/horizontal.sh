#!/bin/sh
echo "horizontal" > /tmp/monitor_orientation
chmod 777 /tmp/monitor_orientation
xrandr --output HDMI-0 --mode 1920x1080 --rate 119.98 --pos 0x1080 --rotate normal --output DP-0 --primary --mode 2560x1440 --rate 164.85 --pos 1920x720 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --mode 3840x2160 --rate 60.00 --pos 4480x0 --rotate normal --output DP-3 --off
exit 0
