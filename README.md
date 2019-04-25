# Scripts
A collection of useful Bash scripts. 

# Table Of Contents
- [Overview](#overview)
- [Install](#install)
- [Commands](#commands)
	- [show-help](#show-help)
	- [sslinfo](#sslinfo)
	- [xcopy and xpaste](#xcopy-and-xpaste)
	- [nvim-swap](#nvim-swap)
	- [fterm](#fterm)
	- [local-dns](#local-dns)
	- [fix](#fix)
	- [todo](#todo)
	- [x](#x)
	- [m](#m)
	- [bkground](#bkground)
	- [wifi](#wifi)
	- [touchx](#touchx)
	- [cgrep](#cgrep)
	- [sx](#sx)
	- [urlcode](#urlcode)
	- [onchanges](#onchanges)
	- [open-pr](#open-pr)
	- [serve](#serve)
	- [snip](#snip)
	- [bloop](#bloop)
	- [pylab](#pylab)
	- [mode](#mode)
	- [xrename](#xrename)
	- [read-out](#read-out)
	- [edit](#edit)
	- [editx](#editx)
	- [md2pdf](#md2pdf)
	- [logs](#logs)
	- [xtend](#xtend)
- [Functions](#functions)
    - [mcdir](#mcdir)

# Overview
This repository provides numerous helpful bash scripts and functions.  

The README contains a brief description of each script and function. For more 
detailed usage information run a script or function with the `-h` option.

# Install
Place this repository in your `$PATH`.

Source the `load-functions.sh` file in your shell profile. This will load 
the custom bash functions into your shell.

# Commands
## show-help
Prints the help text in the top comment of a script.

## sslinfo
Prints the ssl certificate for the provided URL.

## xcopy and xpaste
The xcopy and xpaste scripts emulate the ctrl+{c,v} behavior in the shell.

## nvim-swap
A script which clears any swap files nvim has made.

## fterm
A script which opens a terminal in a floating window using bspwm. 

## local-dns
A tool which modifies your `/etc/hosts` file to give you local domains for 
quick development.

## fix
Fixes terminal after outputting binary garbage.

## todo
Shows todo notes in source files.

## x
Kills current terminal.

## m
Make shortcut.

## bkground
Sets the desktop background with feh.

## wifi
Shortcut for reconnecting to wifi.

## Touchx
Creates a file with execution privileges.

## cgrep
Grep with color argument.

## sx
StartX shortcut.

## urlcode
URL encoding utility.

## onchanges
Runs a command when files change.

## open-pr
Opens a GitHub pull request.

## serve
Local HTTP server using Python 3's `http.server` module.

## snip
Select an area of the screen and take a screen shot.

## bloop
Play bloop noise

## pylab
Start Jupyter Lab without a password.

## mode
Show file mode.

## xrename
Rename X window.

## read-out
Read text out letter by letter.

## edit
Edit file with `$EDITOR`.

## editx
Give file execute permissions and edit with `$EDITOR`.

## md2pdf
Convert markdown to PDF.

## logs
View socklog system logs.

## xtend
Manage displays with xrandr.

# Functions
## mcdir
Create and cd into directory.
