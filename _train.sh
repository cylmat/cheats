#!/usr/bin/env bash 

########
# Display a random training link
#
# Usage:
# wget -qO- https://raw.githubusercontent.com/cylmat/cheats/main/_train.sh | bash
########

LINKS=(
    "https://code.golf/random#php"
    "https://hackerrank.com/domains/algorithms"
    "https://hackerrank.com/domains/data-structures"
    "https://hackerrank.com/domains/regex"
    "https://hackerrank.com/domains/shell"
    "https://www.root-me.org/fr/Challenges/Web-Serveur"
    "https://vimgolf.com?page=$(($RANDOM % 10))"
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
