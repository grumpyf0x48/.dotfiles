#!/usr/bin/env bash

declare -a components=(system ssh git tmux java jbang custom)

for component in "${components[@]}"; do
    component_file="$HOME/.${component}_aliases"
    if [ -f "$component_file" ]; then
        if [ -r "$component_file" ]; then
            . "$component_file"
        else
            echo "WARNING: Skipping $component_file because it is not readable." >&2
        fi
    fi
done
