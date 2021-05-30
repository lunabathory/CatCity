#!/bin/bash

spotifyopen=$(pgrep spotify)
if [[ -n ${spotifyopen}  ]]; then
		playerctl play-pause
	else
		flatpak run com.spotify.Client
	fi