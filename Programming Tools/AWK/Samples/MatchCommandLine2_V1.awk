#!/bin/sh

export pattern="$1"
shift
awk '$0 ~ ENVIRON["pattern"] { print FILENAME ":" $0 }' "$@"
