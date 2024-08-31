#!/bin/bash

SCRIPTPATH=`dirname $(readlink -f $0)`
cd $SCRIPTPATH/..

exclude="--exclude-dir=tools --exclude-dir=.github --exclude-dir=.git"

grep -rn "TODO" $exclude
[[ ! $(grep -rn "TODO" $exclude | wc -l) == 0 ]] && echo -e "\e[33mWARNING: TODO found\e[0m" && exit 0

echo -e "\e[32mSUCCESS\e[0m"
exit 0
