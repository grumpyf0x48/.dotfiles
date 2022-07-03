#!/usr/bin/env bash

function canonical_which() {
    if [ "$1" = "-a" ]; then
        \which -a "$2"
    else
        readlink -e $(\which "$1")
    fi
}

if [ -f ~/.git_aliases ]; then
    . ~/.git_aliases
fi

alias bat='batcat'
alias update='sudo apt update && sudo apt full-upgrade'
alias which='canonical_which'
