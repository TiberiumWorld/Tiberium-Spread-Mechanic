#!/usr/bin/env python3
import os
import sys
import glob
import shutil
import zipfile
import re
import tempfile

# GLOBALS
scriptPath  = os.path.realpath(__file__)
projectRoot = os.path.dirname(os.path.dirname(scriptPath))

projectName = "Tiberium"
versionName = sys.argv[1] if len(sys.argv) <= 2 else "DevBuild"
archiveFileName = "{}_{}.zip".format(projectName, versionName)
remoteFileid = "2374598544"

excludeList = ["resources", "release", "tools", ".png", ".psd", ".zip"]
includeList = ["thumbnail.png"]


def changeDescriptionFile(filename, pattern, repl):
    p = re.compile(pattern, re.MULTILINE)
    text = open(filename, "r").read()
    f = open(filename, "w")
    f.write(p.sub(repl, text))
    f.close()

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
            print("Removed previous archive...")
        except:
            pass


def main():
    os.chdir(projectRoot)
    releasePath = os.path.join(projectRoot, "release")
    releaseProjectPath = os.path.join(projectRoot, "release", projectName)
    archivePath = os.path.join(projectRoot, "release", archiveFileName)

    remove(archivePath)
    remove(releaseProjectPath)

    mkDir(releasePath)
    mkDir(releaseProjectPath)

    files = glob.glob('**', recursive=True)

    for f in files:
        if any(x in f for x in excludeList):
            if not any(x in f for x in includeList):
                continue
        y = os.path.join(releaseProjectPath, f)
        if os.path.isdir(f):  
            print("Creating path:", y)
            mkDir(y)
        else:
            print("Copying:", f, "==>", os.path.join("release", projectName, f))
            shutil.copy(f, y)

    changeDescriptionFile(os.path.join(releaseProjectPath, "descriptor.mod"), fr"{projectName}_DevBuild", projectName)
    changeDescriptionFile(os.path.join(releaseProjectPath, "descriptor.mod"), r"DevBuild", versionName)
    changeDescriptionFile(os.path.join(releaseProjectPath, "descriptor.mod"), r"version=\"0.0.0\"", f"version=\"{versionName}\"")
    changeDescriptionFile(os.path.join(releaseProjectPath, "descriptor.mod"), r"remote_file_id=\"\"", f"remote_file_id=\"{remoteFileid}\"")


    os.chdir(releasePath)

    print("Making archive ({})...".format(archiveFileName))
    with zipfile.ZipFile(archiveFileName, 'w') as releaseArchive:
        releaseFiles = glob.glob(os.path.join(projectName, "**"), recursive=True)
        for f in releaseFiles:
            releaseArchive.write(f)

    changeDescriptionFile(os.path.join(releaseProjectPath, "descriptor.mod"), rf"remote_file_id=\"{remoteFileid}\"", "remote_file_id=\"\"")

if __name__ == "__main__":
    sys.exit(main())