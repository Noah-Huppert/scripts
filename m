#!/usr/bin/env bash
#?
# m - Make shortcut
#
# Usage: m [Make args]
#
# Behavior:
#	Invokes GNU Make with the provided arguments. A Useful shortcut.
#?

# Help argument
if [[ "$1" =~ ^(--help|-h)$ ]]; then
	show-help "$0"
	exit 1
fi

# Invoke make
make "$@"
