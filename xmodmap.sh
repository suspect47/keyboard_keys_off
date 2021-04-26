#!/bin/bash
set -e
#exec > /home/user/inotify.log
function xmm {
xmodmap -e 'remove mod4 = Super_L'
xmodmap -e 'add mod3 = Super_L'
xmodmap -e "keycode 9 = Shift_L"
xmodmap -e "keycode 105 = Shift_L"
xmodmap -e "keycode 37 = Shift_L"
xmodmap -e "keycode 62 = Shift_L"
xmodmap -e "keycode 67 = Shift_L"
xmodmap -e "keycode 68 = Shift_L"
xmodmap -e "keycode 69 = Shift_L"
xmodmap -e "keycode 70 = Shift_L"
xmodmap -e "keycode 71 = Shift_L"
xmodmap -e "keycode 72 = Shift_L"
xmodmap -e "keycode 73 = Shift_L"
xmodmap -e "keycode 74 = Shift_L"
xmodmap -e "keycode 75 = Shift_L"
xmodmap -e "keycode 76 = Shift_L"
xmodmap -e "keycode 95 = Shift_L"
xmodmap -e "keycode 96 = Shift_L"
}
setxkbmap -option -option grp_led:scroll,grp:toggle
xmm
inotifywait --event create -m /dev/input |
while read CHANGED;
do
echo "$(date) change event caught; sleeping for 2 seconds and then disabling keys"
sleep 1
echo "$(date) Disabling keys"
xmm
echo "$(date) done;"
done
