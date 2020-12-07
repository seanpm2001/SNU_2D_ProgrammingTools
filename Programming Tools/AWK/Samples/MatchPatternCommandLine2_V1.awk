#!/bin/sh

pattern="$1"
shift
awk '/'"$pattern"'/ { print FILENAME ":" $0 }' "$@"
