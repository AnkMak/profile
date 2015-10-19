#!/bin/sh

while true; do
	find ~/photo -type f \( -name '*.jpg' -o -name '*.png' -o -name '*.tif' \) -print0 | shuf -n1 -z | xargs -0 feh --bg-scale
	sleep 1m
done
