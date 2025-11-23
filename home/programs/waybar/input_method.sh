#!/bin/sh

im=$(fcitx5-remote -n)

case "$im" in
    "keyboard-us") im="EN" ;;
    "unikey") im="VI" ;;
    *) im="$im" ;;
esac

echo "$im"
