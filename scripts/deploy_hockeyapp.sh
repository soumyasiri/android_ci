#!/bin/sh

############## ------------------ ############
# This will have whole deployment code #######
############## ------------------ ############

echo "Deployment Started!"

PATH='/outputs/apk/app-debug.apk'

# First paramter expected as APK path 
#$CIRCLE_ARTIFACTS/app/outputs/apk/app-debug.apk

#APK_PATH=$1
#APK_PATH='android_ci/build/outputs/apk/app-debug.apk'
APK_PATH=$1$PATH

#echo $APK_PATH

# Second parameter expected as access token
ACCESS_TOKEN=$2

echo $ACCESS_TOKEN

# Theird one is application id
APP_ID=$3

echo $APP_ID

curl \
-F "status=2" \
-F "notify=2" \
-F "ipa=@$APK_PATH" \
-H "X-HockeyAppToken:$ACCESS_TOKEN" \
https://rink.hockeyapp.net/api/2/apps/$APP_ID/app_versions/upload

echo "Deployment finished!"

