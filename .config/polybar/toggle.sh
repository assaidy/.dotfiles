#!/bin/bash

if pgrep -x "polybar" > /dev/null
then
    pkill polybar
    # echo "Polybar is running"
else
    # echo "Polybar is not running"
    polybar
fi

