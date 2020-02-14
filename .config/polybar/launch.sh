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
pantallaDP=`xrandr | grep "DP-0 connected" | wc -l`
pantallaHDMI=`xrandr | grep "HDMI-0 connected" | wc -l`
if [[ $pantallaHDMI -eq "1" ]]
then
	if [[ $pantallaDP -eq "1" ]]
	then
		polybar barLeft &
		polybar barRight &
	else
		polybar barTele &
	fi
else
	if [[ $pantallaDP -eq "1" ]]
        then
		polybar barLeft &
	else
		polybar barTele &
	fi
fi
echo "Bar(s) launched..."
