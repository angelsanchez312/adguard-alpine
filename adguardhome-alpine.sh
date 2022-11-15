#!/bin/ash
echo "Enter the url for the latest AdGuard Home release "
echo "You can find the latest version here: "
echo "https://github.com/AdguardTeam/AdGuardHome/releases"
echo "uname -m lists your architecture as "; uname -m
read aghurl

elevated=doas

# extract in tmp folder
mkdir -p /tmp/AGH/
cd /tmp/AGH/
wget -P /tmp/AGH/ $aghurl 
tar -xf /tmp/AGH/*.tar.gz

#EXEC: Command to move AdGuardHome into the /opt directory
$elevated mv /tmp/AGH/AdGuardHome /opt/


# have AdGuardHome in the /opt/ directory
# TODO: Choose a different location, press enter to skip


# Get a file wriiteen to /etc/init.d/AdGuardHome
# Currently, getting a file from server VS creating the file directly from the script
$elevated wget -P /tmp/AGH/ http://git.local/AdGuardHome

## Step 4 - Enable the service by running doas rc-update add AdGuardHome
#$elevated rc-update add AdGuardHome

## Step 5 - Start the service by running doas rc-service AdGuardHome start
#$elevated rc-update AdGuardHome start

echo "Done!"
echo "Configure AdGuard URL by accessing it here at http://127.0.0.1:3000 or via its IP address!"
