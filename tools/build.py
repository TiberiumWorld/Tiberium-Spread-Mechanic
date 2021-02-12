#!/usr/bin/env python3
import os
import sys
import glob
import shutil
import zipfile

# GLOBALS
scriptPath  = os.path.realpath(__file__)
projectRoot = os.path.dirname(os.path.dirname(scriptPath))

projectName = "Tiberium"
versionName = "DevBulid"
archiveFileName = "{}_{}.zip".format(projectName, versionName)

excludeList = ["resources", "releases", "Tools", ".png", ".psd", ".zip"]


def mkDir(path):
    try:
        os.mkdir(path)
    except:
        pass


def remove(path):
    if os.path.isdir(path):
        try:
            shutil.rmtree(path, ignore_errors=False, onerror=None)
            print("Cleaned up old release...")
        except:
            pass
    if os.path.isfile(path):
        try:
            os.remove(path)
            print("Removed previus archive...")
        except:
            pass


def main():
    os.chdir(projectRoot)
    releasePath = os.path.join(projectRoot, "releases")
    releaseProjectPath = os.path.join(projectRoot, "releases", projectName)
    archivePath = os.path.join(projectRoot, "releases", archiveFileName)

    remove(archivePath)
    remove(releaseProjectPath)

    mkDir(releasePath)
    mkDir(releaseProjectPath)

    files = glob.glob('**', recursive=True)

    for f in files:
        if any(x in f for x in excludeList):
            continue
        y = os.path.join(releaseProjectPath, f)
        if os.path.isdir(f):  
            print("Creating path:", y)
            mkDir(y)
        else:
            print("Copying:", f, "==>", os.path.join("releases", projectName, f))
            shutil.copy(f, y)


    os.chdir(releasePath)

    print("Making archive ({})...".format(archiveFileName))
    with zipfile.ZipFile(archiveFileName, 'w') as releaseArchive:
        releaseFiles = glob.glob(os.path.join(projectName, "**"), recursive=True)
        for f in releaseFiles:
            releaseArchive.write(f)


if __name__ == "__main__":
    sys.exit(main())