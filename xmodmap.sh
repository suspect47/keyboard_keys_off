#!/bin/bash

set -e

exec > /home/user/inotify.log

function xmm {

xmodmap -e 'remove mod4 = Super_L'
xmodmap -e 'add mod3 = Super_L'
xmodmap -e "keycode 9 = Super_L"
xmodmap -e "keycode 105 = Super_L"
xmodmap -e "keycode 37 = Super_L"
xmodmap -e "keycode 62 = Super_L"
xmodmap -e "keycode 67 = Super_L"
xmodmap -e "keycode 68 = Super_L"
xmodmap -e "keycode 69 = Super_L"
xmodmap -e "keycode 70 = Super_L"
xmodmap -e "keycode 72 = Super_L"
xmodmap -e "keycode 73 = Super_L"
xmodmap -e "keycode 74 = Super_L"
xmodmap -e "keycode 75 = Super_L"
xmodmap -e "keycode 76 = Super_L"
xmodmap -e "keycode 95 = Super_L"
xmodmap -e "keycode 96 = Super_L"
}

setxkbmap -option -option grp_led:scroll,grp:toggle

xmm

inotifywait --event create -m /dev/input |
while read CHANGED;
do
echo "$(date) change event caught; sleeping for 2 seconds and then disabling keys"
sleep 2
echo "$(date) Disabling keys"
xmm
echo "$(date) done;"
done
