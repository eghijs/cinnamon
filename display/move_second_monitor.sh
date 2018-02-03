#!/bin/bash

# This script will run a program in fullscreen mode (no borders or
# title bar etc) on a second monitor. It can used for many programs
# and on either the primary or secondary monitor

# Caminho do aplicativo
PROGRAM=’xbmc’

# Cabecario do programa "wmctrl -l"
NAME=’XBMC Media Center’

# Saida para monitor segundario
DEVICE=’HDMI-0′

# If you want the program to be fullscreen on your second monitor
# this variable should be the width of your primary monitor
PRIMARYWIDTH=1920

# Run the program , then wait a bit before carrying on
# If your program doesn’t load in time then try increasing this value
$PROGRAM > /dev/null 2> /dev/null & disown && sleep 3

## Set the Open GL environment variables
# Set the vertical blanking to on
__GL_SYNC_TO_VBLANK=1
# And make sure OpenGL syncs the correct monitor
__GL_SYNC_DISPLAY_DEVICE=”$DEVICE”

# Do we want a screensaver
SDL_VIDEO_ALLOW_SCREENSAVER=0

# Set the dimensions of the program in the monitor
wmctrl -r “$NAME” -e ‘0,’$PRIMARYWIDTH’,-1,-1,-1′

# Maximize it
wmctrl -r “$NAME” -b toggle,fullscreen,maximized_vert