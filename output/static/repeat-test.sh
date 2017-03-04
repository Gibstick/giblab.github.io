#!/bin/sh

# usage: foobar <n> <command>

n="$1"
shift
command="$@"

sys161 kernel $(printf "$command;%.0s" $(seq $n))";q"
