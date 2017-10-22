# Scripts
A collection of useful Bash scripts. 

# Table Of Contents
- [sslinfo](#sslinfo)
- [copy and paste](#copy-and-paste)

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

Copy usage: `echo "some text from stdin" | copy`  

Paste usage: `paste | grep "some"`
