#!/usr/bin/env bash
#?
# load-functions.sh - Load functions into shell
#
# USAGE
#
#    source load-functions.sh
#
# BEHAVIOR
#
#    Load functions into shell, must be sourced.
#
#?

# {{{1 Get functions directory
functions_dir="$(realpath $(dirname "$0"))/functions"

# {{{1 Load functions
for function_file in $(find "$functions_dir" -type f -executable); do
    
    . "$function_file"
done
