#!/usr/bin/env bash
while getopts "h" opt; do
    case "$opt" in
	   h)
		  cat <<EOF
load-functions.sh - Prints a list of function files to load

USAGE

    load-functions.sh

BEHAVIOR

    Prints a space seperated list of absolute paths to bash files containing function
    definitions which should be sourced.

EOF
		  exit 0
		  ;;
	   '?')
		  echo "Error: Unknown option" >&2
		  exit 1
		  ;;
    esac
done

# Get functions directory
prog_dir=$(dirname $(realpath "$0")) 
functions_dir="$prog_dir/functions"

# Print functions
files=()
for function_file in $(find "$functions_dir" -type f -executable); do
    
    files+=("$function_file")
done

echo "${files[@]}"
