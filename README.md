# Scripts
A collection of useful Bash scripts. 

# Table Of Contents
- [Directory](#directory)
	- [sslinfo](#sslinfo)
	- [copy and paste](#copy-and-paste)

# Directory
This section provides an overview of each script this repository contains.

## sslinfo
Prints the ssl certificate for the provided URL.

Usage: `sslinfo [Options] URL`  

Options:

- `--trim,-t`: Removes chunks of math garble (ex., 00:ae:86:12:f2:53:71:57:11) 
               from the output.
- `--page,-p`: Pages the output with the pager configured in the `$PAGER` 
               environment variable.

## copy and paste
The copy and paste scripts emulate the ctrl+{c,v} behavior in the shell.  

copy accepts input from stdin. paste outputs to stdout.
