#!/usr/bin/env bash
#
# Noah Huppert - 12/10/17
#
#?
# x - Exit shortcut
#
# Usage: x
#
# Behavior:
#	Ends the process running the command. Useful for exiting a terminal 
#	with a single character command.
#?

# Help option
if [[ "$1" =~ ^(--help|-h)$ ]]; then
	show-help "$0"
	exit 1
fi

kill -9 "$PPID"
