#!/bin/bash
sleep 10s
sleep 3s && xkbset -bell -feedback sticky -twokey latchlock
sleep 3s && xkbset exp 64 '=sticky' '=twokey' '=latchlock'
sleep 3s && xmodmap ~/.config/keyboard_config/swapper
