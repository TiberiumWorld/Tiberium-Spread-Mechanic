#!/bin/bash

SCRIPTPATH=`dirname $(readlink -f $0)`
cd $SCRIPTPATH/..

exclude="--exclude-dir=tools --exclude-dir=.github --exclude-dir=.git"

grep -rn "FIXME" $exclude
[[ ! $(grep -rn "FIXME" $exclude | wc -l) == 0 ]] && echo -e "\e[31mERROR: FIXME found\e[0m" && exit 1

echo -e "\e[32mSUCCESS\e[0m"
exit 0