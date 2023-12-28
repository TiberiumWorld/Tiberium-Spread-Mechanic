#!/bin/bash

set -e 

VERSION_TAG=$*
if [ "$VERSION_TAG" == "" ]; then
    VERSION_TAG="0.0.0"
    echo "WARNING: No version number provided using $VERSION_TAG"
else
    echo "Prepering build for version $VERSION_TAG"
fi

ScriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
RootPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"

cd $RootPath

python3 ./tools/build.py $VERSION_TAG