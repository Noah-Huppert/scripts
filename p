#!/usr/bin/env bash
function removeExtraValues() {
	grep -o "\(Username\|Password\|URL\): .*"
}

function isolateValue() { # (key, appendStr)
	# Check key provided
	if [[ -z "$1" ]]; then
		echo "Error: Key must be provided"
		return "Error: Key must be provided"
	fi
	key="$1"

	# Make delim word = $key all uppercase
	delimWord=$(echo "$key" | tr '[:lower:]' '[:upper:]')

	perl -pe "s/$key: (.*)\n/!$delimWord!\$1!$delimWord!$2/"
}

function extractValue() { # (key)
	# Check key provided
	if [[ -z "$1" ]]; then
		echo "Error: Key must be provided"
		return "Error: Key must be provided"
	fi
	key="$1"

	# Make delim word = $key all uppercase
	delimWord=$(echo "$key" | tr '[:lower:]' '[:upper:]')

	perl -pe "s/.*!$delimWord!(.*)!$delimWord!.*/\$1/"
}

COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_BLUE='\033[0;34m'
NC='\033[0m' # No Color


# Check lpass cli
if [[ -z "$(which lpass)" ]]; then
	echo "Error: LastPass CLI must be installed"
	exit 1
fi

# Check first arg
if [[ -z "$1" ]]; then
	echo "Error: Expected one argument"
	exit 1
fi

# Show
echo "Searching: $@"
info=$(lpass show --all -G $@)

# if multiple matches found
if [[ "$info" =~ "Username" ]]; then
	# Condense
	info=$(echo "$info" | removeExtraValues | isolateValue "Username" | isolateValue "Password" | isolateValue "URL" "\n")
	
	while read -r line; do
		username=$(echo "$line" | extractValue "username")
		password=$(echo "$line" | extractValue "password")
		url=$(echo "$line" | extractValue "url")

		echo -e "$COLOR_GREEN[$url] $COLOR_BLUE$username$NC  :  $COLOR_RED$password$NC"
	done <<< "$info"

fi
