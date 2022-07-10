#!/usr/bin/env bash

declare -a components=("system" "git" "custom")

for component in "${components[@]}"; do
    component_file="$HOME/.${component}_aliases"
    if [ -f "$component_file" ]; then
        if [ -x "$component_file" ]; then
            . "$component_file"
        else
            echo "WARNING: Cannot source $component_file because it is not executable !" >&2
        fi
    fi
done
