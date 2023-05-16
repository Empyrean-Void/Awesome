#! /bin/sh

chosen=$(printf "󰍺  Dual Display\n󰍹  External\n󰍹  Laptop" | dmenu)

case "$chosen" in
	"󰍺  Dual Display")
        if [[ $(xrandr -q | grep "HDMI-0 disconnected") ]];
        then
            exit 1
        fi
        xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal \
            --output eDP-1-1 --mode 1920x1080 --pos 0x1080 --rotate normal;;
	"󰍹  External") 
        if [[ $(xrandr -q | grep "HDMI-0 disconnected") ]];
        then
            exit 1
        fi
        xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal \
            --output eDP-1-1 --off;;
	"󰍹  Laptop")
        xrandr --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal \
            --output HDMI-0 --off;;
	*) exit 1 ;;
esac
