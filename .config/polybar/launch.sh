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
pantallaCentral=`xrandr | grep "DP-0 connected" | wc -l`
pantallaDreta=`xrandr | grep "DP-2 connected" | wc -l`
pantallaEsquerre=`xrandr | grep "HDMI-0 connected" | wc -l`
if [[ $pantallaDreta -eq "1" ]]
then
  MONITOR=DP-2 polybar barRight &
fi
if [[ $pantallaCentral -eq "1" ]]
then
  MONITOR=DP-0 polybar barCenter &
fi
if [[ $pantallaEsquerre -eq "1" ]]
then
  MONITOR=HDMI-0 polybar barLeft &
fi
sleep 2
algunaPantalla=`pgrep polybar | wc -l`
if [[ $algunaPantalla -eq "0" ]]
then
  polybar barTele &
fi
echo "Bar(s) launched..."
