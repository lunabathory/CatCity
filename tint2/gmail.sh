#!/bin/bash

mail=$(~/.config/tint2/gmail.py)

if [[ $mail -ge 1 ]]; then
	echo "$mail" 
	notify-send -u low "You have new mail!"
else 
	echo "$mail"  
fi