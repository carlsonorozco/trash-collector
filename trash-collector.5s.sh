#!/bin/bash

# Trash Collector is a plugin for BitBar that enables you to empty your trash
# BitBar plugin - https://github.com/carlsonorozco/trash-collector
#
# by Carlson Orozco
#
# Refresh every 5 seconds

about="About Trash Collector | color=red href=https://github.com/carlsonorozco/trash-collector"

trash_count=$(find $HOME/.Trash/  | wc -l)
trash_count=$((trash_count-1))

if [ "$1" = 'empty' ]; then
    osascript -e '
    tell application "Finder"
        empty the trash
    end tell'
    exit
fi

if [ "$1" = 'open' ]; then
    open $HOME/.Trash/
    exit
fi

if [ $((trash_count)) = 0 ]; then
    echo "🗑 | bash=$0 param1=open terminal=false"
else
    echo "$trash_count🗑 | bash=$0 param1=open terminal=false"
    echo '---'
    echo "Empty Trash | bash=$0 param1=empty terminal=false"
fi

echo '---'
echo "$about"