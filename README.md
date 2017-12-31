# Scripts
A collection of useful Bash scripts. 

# Table Of Contents
- [show-help](#show-help)
- [bklight](#bklight)
- [sslinfo](#sslinfo)
- [copy and paste](#copy-and-paste)
- [nvim-swap](#nvim-swap)
- [fterm](#fterm)
- [local-dns](#local-dns)
- [fix](#fix)
- [todo](#todo)
- [x](#x)
- [m](#m)
- [bkground](#bkground)

# show-help
Prints the text in the top comment of a script that is between two `#?` 
comments. These two `#?` comments act as tags, to designate exactly what text 
to print.  

Usage: `show-help <file name>`  

For example, most of the scripts have a top comment similar to this:

```
#!/usr/bin/env bash
# 
# Noah Huppert - MM/DD/YY
#
#?
# Foo bars the specifeid baz from entering the the specified ipsum
#
# Usage: foo [Options] BAZ IPSUM
#
# Options:
# 	--verbose    Prints extra run information
#
# Args:
# 	1. BAZ (string): Baz to bar from entering the ipsum
#	2. IPSUM (string): Ipsum to bar the specified baz from entering
#
# Return Values:
#	0     = Success
# 	Not 0 = Failure
#?
```

If one were to run `show-help` on this file, the text between the `#?` comments 
would be displayed: 

```
Foo bars the specifeid baz from entering the the specified ipsum

Usage: foo [Options] BAZ IPSUM

Options:
	--verbose    Prints extra run information

Args:
	1. BAZ (string): Baz to bar from entering the ipsum
	2. IPSUM (string): Ipsum to bar the specified baz from entering

Return Values:
	0     = Success
 	Not 0 = Failure
```

Notice how the preceding comments are removed as well.

# bklight
Controls the display backlight. See the command help output for configuration 
details.  

The bklight command has 3 valid sub commands: get, set, and increment.

Usage: `bklight COMMAND <Sub-Args...>`  

Get can retrieve the following values: percent, raw, and max.  
Set can set the following values: percent, raw.  
Increment adds or subtracts a value from the current percent value.  

If a valid percent value is provided as the command, bklight will set the 
backlight to that percent. This is a useful shorthand.

Shorthand usage: `bklight <percent value>`

## Setup
Steps were sourced from [this SO answer](https://unix.stackexchange.com/questions/337663/how-to-write-to-sys-with-a-script-after-rebooting-sudo/337671#337671).  

To allow user's to invoke the bklight script without typing their password every 
time do the following:  

1. Make a file called `/etc/sudoers.d/bklight`  
2. Enter the contents:  
```
user ALL=(ALL) NOPASSWD:/home/user/Documents/bin/scripts/bklight
```
Be sure to replace `user` (2 occurances) with your username.

# sslinfo
Prints the ssl certificate for the provided URL.

Usage: `sslinfo [Options] URL`  

Options:

- `--trim,-t`: Removes chunks of math garble (ex., 00:ae:86:12:f2:53:71:57:11) 
               from the output.
- `--page,-p`: Pages the output with the pager configured in the `$PAGER` 
               environment variable.

# copy and paste
The copy and paste scripts emulate the ctrl+{c,v} behavior in the shell.  

Copy accepts input from stdin. Paste outputs to stdout.  

Copy usage: `<some input> | copy`

Paste usage: `paste`

# nvim-swap
A script which clears any swap files nvim has made. It takes no arguments 
and always removes any `*.swp` files in the `$HOME/.local/share/nvim/swap` 
directory.  

Usage: `nvim-swap`

# fterm
A script which opens a terminal in a floating window using bspwm. The terminal 
to open should be specified by the `$TERMINAL` variable.

Usage: `fterm`

# p
LastPass password retrieval script using the lastpass cli.  

Usage: `p MATCHSTR`  

Args:

- `MATCHSTR` (string): Fuzzy match string to search with

# local-dns
A tool which modifies your `/etc/hosts` file to give you local domains for 
quick development.  

Usage: `local-dns CMD <args...>`  

Commands:

- `init`
    - Creates the `$HOME/.config/local-dns` directory and copies your current 
      `/etc/hosts` to this location
- `set KEY VAL`
    - Sets the `KEY` subdomain to point to the provided `VAL`
- `rm KEY`
    - Removes the provided `KEY`

# fix
Fixes terminal after outputting binary garbage.  

Usage: `fix`

# todo
Shows todo notes in source files.  

Usage: `todo`

# x
Kills current terminal.  

Usage: `x`

# m
Make shortcut.  

Usage: `m [Make arguments]`

# bkground
Sets the desktop background with feh.  

Usage: `bkground`
