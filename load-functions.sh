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
for function_file_name in mcdir; do
    function_file="$functions_dir/$function_file_name"
    
    . "$function_file"
done
