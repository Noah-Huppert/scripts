#!/usr/bin/env bash
#?
# m - Make shortcut
#
# USAGE
#	m [OPTIONS] [Make args]
#
# OPTIONS
#	--help,-h    Display help text
#
# BEHAVIOR
#	Invokes GNU Make with the provided arguments. A Useful shortcut.
#?

# Help argument
if [[ "$1" =~ ^(--help|-h)$ ]]; then
	show-help "$0"
	exit 1
fi

# Invoke make
make "$@"
