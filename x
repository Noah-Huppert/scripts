#!/usr/bin/env bash
#?
# X - Exit shortcut
#
# USAGE
#	x [OPTIONS]
#
# OPTIONS
#	--help,-h    Display help text
#
# BEHAVIOR
#	Ends the process running the command. Useful for exiting a terminal 
#	with a single character command.
#?

# Help option
if [[ "$1" =~ ^(--help|-h)$ ]]; then
	show-help "$0"
	exit 1
fi

kill -9 "$PPID"
