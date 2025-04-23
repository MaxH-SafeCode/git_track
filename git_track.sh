#!/bin/bash

##############################################################################
f="git_version.h"
echo Creating $f
hash=$(git rev-parse HEAD)
hash_short=$(git rev-parse HEAD | sed -z 's/^\(.\{8\}\).*$/\1/')
date=$(git show -s --format=%ci)
dirty="$(git status --short | head -n1 | sed 's/^.*[^ ]*$/-modified/')"

echo \#ifndef __GIT_VERSION_H__ > $f
echo \#define __GIT_VERSION_H__ >> $f
echo \/\* THIS FILE IS AUTO GENERATED \*\/ >> $f
echo \/\* DO NOT TRACK THIS FILE WITH THE VCS \*\/ >> $f
echo \/\* GIT_TRACK_DIRTY can be used to indicate that status is not clean \*\/
echo \#define GIT_TRACK_DATE \"${date}\" >> $f
echo \#define GIT_TRACK_HASH \"${hash}\" >> $f
echo \#define GIT_TRACK_SHORT_HASH \"${hash_short}\" >> $f
echo \#define GIT_TRACK_DIRTY \"${dirty}\" >> $f
echo \#define GIT_VERSION_HASH_NUMERIC \"0x${hash_short}\" >> $f
echo \#endif >> $f

##############################################################################
#Future
#Get SW commit data
#Get HW commit data
#Get HW/IP commit data  ==> Recursively and generate a super string?
