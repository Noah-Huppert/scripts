# Scripts
A collection of useful Bash scripts. 

# Table Of Contents
- [show-help](#show-help)
- [bklight](#bklight)
- [sslinfo](#sslinfo)
- [copy and paste](#copy-and-paste)
- [nvim-swap](#nvim-swap)

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

The bklight command has 2 valid sub commands: get and set.

Get can retrieve the following values: percent, raw, and max.
Set can set the following values: percent, raw.

Usage: `bklight COMMAND <Sub-Args...>`

If a valid percent valid is provided as the command, bklight will set the 
backlight to that percent. This is a useful shorthand.

Shorthand usage: `bklight <percent value>`

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
