#!/usr/bin/env bash

function run {
    if ! pgrep -f $1; then
        $@ &
    fi
}

run nitrogen --random --set-scaled ~/Pictures/Background/
