#! /bin/sh

# Import Current Theme

chosen=$(printf "  Power Off\n  Restart\n  Suspend" | rofi -dmenu -config "~/.config/rofi/power.rasi" -i -p "Power Menu:")

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Suspend") systemctl suspend ;;
	*) exit 1 ;;
esac
