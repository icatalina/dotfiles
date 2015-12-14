#!/usr/bin/env bash

[[ `defaults read com.apple.finder AppleShowAllFiles` = 'NO' ]] && new='YES' || new='NO'

defaults write com.apple.finder AppleShowAllFiles $new
ps -e | grep [F]inder | awk "{print \$1}" | xargs kill -9 &

