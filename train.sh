#!/usr/bin/env bash 

########
# Display a random training link
#
# Use with wget 
########

LINKS=(
    "https://code.golf/random#php"
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
