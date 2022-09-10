#!/usr/bin/env bash
if test -f "/tmp/workmode"; then
  /home/klanc/.config/polybar/launchWork.sh
else
  /home/klanc/.config/polybar/launch.sh
fi
