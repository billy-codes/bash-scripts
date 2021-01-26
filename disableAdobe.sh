#!/bin/bash

CCAPP="/Library/LaunchAgents/com.adobe.AdobeCreativeCloud.plist"
UPDATER="/Library/LaunchAgents/com.adobe.AAM.Updater-1.0.plist"

echo "Running $0"
echo "1. Turn OFF StartUp Entry"
echo "2. Turn ON StartUp Entry"
echo "3. DELETE StartUp Entry"
read -p "Select Option: " OPTION
if [ $OPTION = 1 ]; then
  echo "Killing Adobe Services" 
	launchctl unload -w ~/Library/LaunchAgents/com.adobe.AdobeCreativeCloud.plist
	launchctl unload -w ~$UPDATER
	echo "Adobe CC Services Successfully DISABLED"

elif [ OPTION = 2 ]; then 
	echo "Turning Adobe CC Services ON"
	launchctl load -w $CCAPP
	launchctl load -w $UPDATER
	echo "Adobe CC Services Sucessfully ENABLED"
elif [ OPTION = 3 ]; then 
	echo "DELETING Startup Entry"
	rm -rf $CCAPP
	rm -rf $UPDATER
	echo "Successfully DELETED Startup Entries"
else
	echo "Invalid Option"
fi



