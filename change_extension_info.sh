#!/bin/bash

newName=$1
newVersion=$2
packageName=$3
deployDir=$4

cd $deployDir

yarn --no-immutable

# change package name
yarn run json -I -f ../package.json -e "this.name=\"${newName}\""

# restore correct package version (without "-vscode" postfix)
newVersionWithoutPostfix="$(echo $newVersion | sed -e 's/-vscode//g')"
yarn run json -I -f ../package.json -e "this.version=\"${newVersionWithoutPostfix}\""
