# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch bar
#polybar makc -r -c ~/.config/polybar/config &
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload makc -c ~/.config/polybar/config &
  done
else
  polybar --reload makc -c ~/.config/polybar/config &
fi

#if [[ $(xrandr -q | grep 'HDMI-A-0 connected') ]]; then
#	polybar secondary &
#fi
