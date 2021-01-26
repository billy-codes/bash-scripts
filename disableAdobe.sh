#!/bin/bash

ADOBE_CCAPP = "~/Library/LaunchAgents/com.adobe.AdobeCreativeCloud.plist"
ADOBE_UPDATER = "~/Library/LaunchAgents/com.adobe.AAM.Updater-1.0.plist"i

echo "Running $0"
echo "Please Select Option:"
echo "1. Turn OFF StartUp Entry"
echo "2. Turn ON StartUp Entry"
echo "3. DELETE StartUp Entry"
read OPTION

if [OPTION == 1]
then
	echo "Killing Adobe Services" 
	launchctl unload -w $ADOBE_CCAPP
	launchctl unload -w $ADOBE_UPDATER
	echo "Adobe CC Services Successfully DISABLED"
elif [OPTION == 2]
then 
	echo "Turning Adobe CC Services ON"
	launchctl load -w $ADOBE_CCAPP
	launchctl load -w $ADOBE_UPDATER
	echo "Adobe CC Services Sucessfully ENABLED"
elif [OPTION == 3]
then 
	echo "DELETING Startup Entry"
	rm -rf $ADOBE_CCAPP
	rm -rf $ADOBE_UPDATER
	echo "Successfully DELETED Startup Entries"
else
	echo "Invalid Option"
	break
fi



