#!/bin/sh

for file in ./extra/wezterm*.toml; do
	variant=$(echo "$file" | cut -d '-' -f 2 | cut -d '.' -f 1)
	echo "copying $file to $XDG_CONFIG_HOME/wezterm/colors/uniwa-$variant.toml"
	cp -f "$file" "$XDG_CONFIG_HOME/wezterm/colors/uniwa-$variant.toml"
done
