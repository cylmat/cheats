#!/usr/bin/env bash 

########
# Display a random training link
#
# Usage:
# wget -qO- https://raw.githubusercontent.com/cylmat/cheats/main/_train.sh | bash
########

LINKS=(
    "https://code.golf/random#php"
    "https://www.root-me.org/fr/Challenges"
)

SIZE=${#LINKS[@]}
SELECT_NUM=$(($RANDOM % $SIZE))
SELECT_URL=${LINKS[$SELECT_NUM]}

echo "
#############################
# TRAINING SESSION          #
# Click to launch this url: #
# $SELECT_URL
#############################"
