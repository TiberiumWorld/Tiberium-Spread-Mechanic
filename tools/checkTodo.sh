#!/bin/bash

SCRIPTPATH=`dirname $(readlink -f $0)`
cd $SCRIPTPATH/..

exclude="--exclude-dir=tools"

grep -rn "TODO" $exclude
[[ ! $(grep -rn "TODO" $exclude | wc -l) == 0 ]] && echo "WARNING: TODO found" && exit 0

echo "SUCCESS"
exit 0
