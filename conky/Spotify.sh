#!/bin/bash

status=$(playerctl status)
artist=$(playerctl metadata artist)
title=$(playerctl metadata title)
if [[ ${status} == "Playing" ]]; then
		echo ${artist} '-' ${title}
	elif [[ ${status} == "Paused" ]]; then
		echo ${artist} '-' ${title}
	else
		echo 
	fi