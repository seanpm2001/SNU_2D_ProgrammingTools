#!/bin/sh

pattern="$1"
shift
awk '$0 ~ pattern { print FILENAME ":" $0 }' "pattern=$pattern" "$@"
