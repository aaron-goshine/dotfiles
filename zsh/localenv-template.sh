#! /bin/bash
# Author: Aaron
# Script: Your Script Name
# Date: (Today's Date)
# Description: (Brief description of the script)

# Your code here
export _DATABASE_URL=""
export HEROKU_POSTGRESQL_PINK_URL=""
export SSID=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'`
export GIT_AUTHOR_NAME="" 
export GIT_COMMITTER_NAME="" 
export GIT_AUTHOR_EMAIL=""
export GIT_COMMITTER_EMAIL="" 
