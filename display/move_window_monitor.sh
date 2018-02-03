#!/bin/bash
# Site oficial: https://pastebin.com/zjFaRh28
# Site: https://github.com/linuxmint/Cinnamon/issues/2190
#
# If you want @wulftone (or others), at least until Cinnamon maybe add this possibility later, here is the script I personally use for that (found I don't know anymore where on the web):
#
# NEW LINK —AGAIN—: http://pastebin.com/zjFaRh28
# (updated version again, now fully OK for normal -and- maximized windows ;
# I've never looked more than that to this script content in fact, but was just basic shell script line errors about the maximized support! I fixed that. 
# By the way, you just need to have these 3 tools installed before: xdotool, xwininfo, wmctrl)
#
# Just edit and adapt these 2 lines at top for your situation (height is managed dynamically):
# — screen width (the effective resolution! just set yours here.) —
# screen_width1=1600
# screen_width2=1920
#
# Working nice here, at least for my configuration (primary screen at right, secondary screen at left). But else, can be easily adapted if required, 
# even though there is no particular reason for this script to not work in a flipped screen configuration: as long as you've a dual monitor configuration, 
# it should be OK. Hope it'll work for you too then.
#
# I personally set to trigger this script by setting:
# Command to execute: sh /path/to/move_window_monitor.sh
# Keyboard shortcut: F9
#
# Pressing F9 will switch the current active window to the other screen. And vice versa if I press multiple times on it so. ;)
#
# The window size is always kept, but the window position is always set at left of screen in that script —can be enhanced of course—. Not a real problem though according to me.
 
# screen width (the effective resolution! just set yours here.)
screen_width1=1600
screen_width2=1920
 
# active window
window=`xdotool getactivewindow`
 
# get active window size and position
x=`xwininfo -id $window | grep "Absolute upper-left X" | awk '{print $4}'`
w=`xwininfo -id $window | grep "Width" | awk '{print $2}'`
 
maximized=false
 
# window on left monitor
if [ "$x" -lt "$screen_width1" ]; then
    if [ "$w" -eq "$screen_width1" ]; then
        maximized=true
    fi
 
    if $maximized; then
        wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
    fi
 
    wmctrl -r :ACTIVE: -e 0,$screen_width1,-1,-1,-1
 
    if $maximized; then
        wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    fi
 
# window on right monitor
else
    if [ "$w" -eq "$screen_width2" ]; then
        maximized=true
    fi
 
    if $maximized; then
        wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
    fi
 
    wmctrl -r :ACTIVE: -e 0,0,-1,-1,-1
 
    if $maximized; then
        wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    fi
fi