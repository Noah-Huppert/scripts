#!/usr/bin/env bash
#?
# xtend - Manage displays with xrandr
#
# USAGE
#
#    xtend OPTIONS ARGUMENTS
#
# OPTIONS
#
#    -h    Show help text
#
# ARGUMENTS
#
#    CMD          Command to run, see COMMANDS section
#    PLACEMENT    If CMD is "up" or "toggle" specifies which direction
#                 to extend display. Use Xrandr direction arguments.
#                 Default is "--right-of". 
#
# COMMANDS
#
#    on     Turn on external display.
#           
#    off    Turn off external display
#
#    toggle    If external display on -> turn off, if off -> turn on.
#
# BEHAVIOR
#
#    Turns on or off an external display using xrandr.
#
#    Runs the $XDG_CONFIG_HOME/xtend/$CMD hook script if exists. The $CMD
#    environment variable and the variables in the CONFIGURATION are passed
#    to the hook scripts.
#
# CONFIGURATION
#
#    XTEND_EXTERNAL_DISPLAY    Name of the external display, defaults to HDMI1
#    XTEND_INTERNAL_DISPLAY    Name of the built in display, defaults to eDP1
#
#?

# {{{1 Configuration
CMD_ON=on
CMD_OFF=off
CMD_TOGGLE=toggle

if [ -z "$XTEND_EXTERNAL_DISPLAY" ]; then
    XTEND_EXTERNAL_DISPLAY=HDMI1
fi

if [ -z "$XTEND_INTERNAL_DISPLAY" ]; then
    XTEND_INTERNAL_DISPLAY=eDP1
fi

export XTEND_EXTERNAL_DISPLAY
export XTEND_INTERNAL_DISPLAY

# {{{1 Helpers
function die() {
    echo "Error: $@" >&2
    exit 1
}    

# {{{1 Options
while getopts "h" opt; do
    case "$opt" in
	h)
	    show-help "$0"
	    exit 1
	    ;;
	'?') die "Unknown option" ;;
    esac
done

# {{{1 Run command
CMD="$1"
shift

case "$CMD" in
    on)
	placement="$1"
	if [ -z "$placement" ]; then
	    placement=--right-of
	fi
	if ! xrandr --output "$XTEND_EXTERNAL_DISPLAY" "$placement" "$XTEND_INTERNAL_DISPLAY" --auto; then
	    die "Failed to turn on external display"
	fi

	echo "Turned on $XTEND_EXTERNAL_DISPLAY"
	;;
    off)
	if ! xrandr --output "$XTEND_EXTERNAL_DISPLAY" --off; then
	    die "Failed to turn off external display"
	fi

	echo "Turned off $XTEND_EXTERNAL_DISPLAY"
	;;
    toggle)
	echo "Toggle"
	# If external display on
	if ! xrandr | grep "$XDG_EXTERNAL_DISPLAY" &> /dev/null; then
	    echo "Extended, turning off"
	    $0 off
	else # If off
	    echo "Not extended, turning on"
	    $0 on "$@"
	fi
	;;
    *)
	die "Unknown CMD \"$CMD\""
	;;
esac

# {{{1 Run hooks
if [ -z "$XDG_CONFIG_HOME" ]; then
    die "Cannot run hook, XDG_CONFIG_HOME environment variable not set"
fi

hook_script="$XDG_CONFIG_HOME/xtend/$CMD"

if [ ! -f "$hook_script" ]; then
    exit 0
fi

echo "Running $hook_script hook"
$hook_script
