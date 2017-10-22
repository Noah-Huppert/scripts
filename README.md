# Scripts
A collection of useful Bash scripts. 

# Table Of Contents
- [Directory](#directory)
	- [sslinfo](#sslinfo)

# Directory
This section provides an overview of each script this repository contains.

## sslinfo
sslinfo prints a domain's ssl certificate. 

Args:

- `--trim,-t`: Removes chunks of math garble (ex., 00:ae:86:12:f2:53:71:57:11) 
               from the output.
- `--page,-p`: Pages the output with the pager configured in the `$PAGER` 
               environment variable.
