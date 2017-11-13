#!/usr/bin/env bash
function ABC() {
	grep -o "only this"
}
function removeExtraValues() {
	grep -o "^\(Username\|Password\|URL\): .*"
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
BG_LIGHT_BLUE='\e[104m'
BG_GRAY='\e[100m'
UNDERLINE='\e[4m'
NC='\033[0m' # No Color
NU='\e[24m' # No underline

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

# Check options
# --url,-u: Only print URL
# --username,-n: Only print username
# --password,-p: Only print password
# --raw,-r: Don't trim or proccess output at all, act as an alias for: lpass show --all -G
while (( "$#" > 1 )); do
	if [[ "$1" == "--url" || "$1" == "-u" ]]; then
		OPTION_ONLY_URL=true
		OPTION_PRESENT=true
	elif [[ "$1" == "--username" || "$1" == "-n" ]]; then
		OPTION_ONLY_USERNAME=true
		OPTION_PRESENT=true
	elif [[ "$1" == "--password" || "$1" == "-p" ]]; then
		OPTION_ONLY_PASSWORD=true
		OPTION_PRESENT=true
	elif [[ "$1" == "--raw" || "$1" == "-r" ]]; then
		OPTION_RAW=true
		OPTION_PRESENT=true
	else
		break
	fi

	if [[ "$OPTION_PRESENT" ]]; then
		shift
	fi
done

# Show
# Don't print "searching..." str if an option is present and not the "raw" option
if [[ ! "$OPTION_PRESENT" && ! "$OPTION_RAW" ]]; then
	echo -e "${UNDERLINE}Searching: $@$NU"
	echo 
fi

if [[ ! "$OPTION_RAW" ]]; then
	info=$(lpass show --all -G $@)

	# if multiple matches found
	if [[ "$info" =~ "Username" ]]; then
		# Condense
		info=$(echo "$info" | removeExtraValues | isolateValue "Username" | isolateValue "Password" | isolateValue "URL" "\n")

		while read -r line; do
			username=$(echo "$line" | extractValue "username" 2)
			password=$(echo "$line" | extractValue "password" 2)
			url=$(echo "$line" | extractValue "url" 2)

			if [[ "$OPTION_ONLY_URL" ]]; then
				echo "$url"
			elif [[ "$OPTION_ONLY_USERNAME" ]]; then
				echo "$username"
			elif [[ "$OPTION_ONLY_PASSWORD" ]]; then
				echo "$password"
			else
				echo -e "$COLOR_GREEN[$url]$NC $COLOR_BLUE$username$NC  :  $COLOR_RED$password$NC"
			fi
		done <<< "$info"

	fi
else
	lpass show --all -G "$@"
fi
