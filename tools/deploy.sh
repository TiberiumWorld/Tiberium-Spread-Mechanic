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

modname="Tiberium"

cd $RootPath

[[ ! -d release/$modname ]] && mkdir -p release/$modname

echo "Prepering build..."

for filePath in $(find); do
    # Dont copy .
    if [[ "$filePath" == "." ]]; then continue; fi;
    # Directories
    if [[ "$(echo "$filePath" | awk -F "/" '{print $2}')" == "." ]]; then continue; fi;
    if [[ "$(echo "$filePath" | awk -F "/" '{print $2}')" == ".git" ]]; then continue; fi;
    if [[ "$(echo "$filePath" | awk -F "/" '{print $2}')" == "release" ]]; then continue; fi;
    if [[ "$(echo "$filePath" | awk -F "/" '{print $2}')" == "tools" ]]; then continue; fi;
    if [[ "$(echo "$filePath" | awk -F "/" '{print $2}')" == "resources" ]]; then continue; fi;
    # Files
    #if [[ "$(echo "$filePath" | awk -F "/" '{print $2}')" == "Tiberium.mod" ]]; then continue; fi;
    # File types
    if [[ "$(echo $(basename $filePath) | awk -F "." '{print $2}')" == "psd" ]]; then continue; fi;
    if [[ "$(echo $(basename $filePath) | awk -F "." '{print $2}')" == "png" ]]; then continue; fi;
    if [[ "$(echo $(basename $filePath) | awk -F "." '{print $2}')" == "zip" ]]; then continue; fi;
    
    [[ -f $release/$modname/$filePath ]] && rm release/$modname/$filePath
    echo Copying $filePath
    echo "$filePath" | cpio -p release/$modname/ >/dev/null 2>&1

done

echo "Setting up documents..."

sed -i "s/0.0.0/$VERSION_TAG/g" release/$modname/descriptor.mod
sed -i "s/DevBuild/$VERSION_TAG/g" release/$modname/descriptor.mod

sed -i "s/0.0.0/$VERSION_TAG/g" release/$modname/Tiberium.mod
sed -i "s/DevBuild/$VERSION_TAG/g" release/$modname/Tiberium.mod

sed -i 's/<p[^P]*p>//g' release/$modname/README.md

cd release
[[ -f $modname-$VERSION_TAG.zip ]] && rm $modname-$VERSION_TAG.zip
mv $modname/Tiberium.mod Tiberium.mod
zip $modname-$VERSION_TAG.zip -r $modname Tiberium.mod
mv Tiberium.mod $modname/Tiberium.mod
