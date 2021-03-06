#!/bin/sh

############## ------------------ ############
# This will have whole deployment code #######
############## ------------------ ############

echo "Deployment Started!"


# First paramter expected as APK path 
#$CIRCLE_ARTIFACTS/app/outputs/apk/app-debug.apk

#APK_PATH=$1
#APK_PATH='android_ci/build/outputs/apk/app-debug.apk'
APK_PATH=$1

echo $APK_PATH

# Second parameter expected as access token
ACCESS_TOKEN=$2

echo $ACCESS_TOKEN

# Theird one is application id
APP_ID=$3

echo $APP_ID

#NOTES=$4
#
#echo $NOTES

curl \
var=$'(<./release_notes.txt)'
-F "status=2" \
-F "notify=2" \
-F "notes=$var" \
-F "ipa=@$APK_PATH" \
-H "X-HockeyAppToken:$ACCESS_TOKEN" \
https://rink.hockeyapp.net/api/2/apps/$APP_ID/app_versions/upload

echo "Deployment finished!"

