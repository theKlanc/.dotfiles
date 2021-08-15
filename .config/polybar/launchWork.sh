#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

#polybar -r barLeft &
#polybar -r barRight &
#echo "Bars launched..."
#exit

# Launch bar
# Bar is the name set in the polybar config, so if you change it, you have to change it here too.
pantallaHDMI=`xrandr | grep "HDMI-0 connected" | wc -l`
pantallaDVID=`xrandr | grep "HDMI-1 connected" | wc -l`
if [[ $pantallaHDMI -eq "1" ]]
then
  MONITOR=HDMI-0 polybar barRight &
fi
if [[ $pantallaDVID -eq "1" ]]
then
  MONITOR=HDMI-1 polybar barLeftTurbo &
fi
echo "Bar(s) launched..."
