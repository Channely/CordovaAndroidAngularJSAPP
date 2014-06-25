#!/bin/sh
grunt --force
rm -rf ../www/*
cp -rf dist/* ../www/
cd ../
cordova build android
cd webapp/
rm *debug.apk
cp ../platforms/android/ant-build/*debug.apk .
echo "Complete Now.You can install it by 'adb install -r *debug.apk'"
adb install -r *debug.apk

