#!/bin/sh

if ! pgrep -x "$1" >/dev/null 2>&1; then
    exec $1
fi
