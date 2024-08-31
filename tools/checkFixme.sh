#!/bin/bash

SCRIPTPATH=`dirname $(readlink -f $0)`
cd $SCRIPTPATH/..

exclude="--exclude-dir=tools"

grep -rn "FIXME" $exclude
[[ ! $(grep -rn "FIXME" $exclude | wc -l) == 0 ]] && echo "ERROR: FIXME found" && exit 1

echo "SUCCESS"
exit 0