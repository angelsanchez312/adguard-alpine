#!/bin/ash
echo "Enter the url for the latest AdGuard Home release "
echo "You can find the latest version here: "
echo "https://github.com/AdguardTeam/AdGuardHome/releases"
echo "uname -m lists your architecture as "; uname -m
read aghurl

RND1=$$

# Extract archive from tmp folder
mkdir -p /tmp/AGH.$RND1/
wget -P /tmp/AGH.$RND1/ $aghurl 
tar -xf /tmp/AGH.$RND1/*.tar.gz

# Move AdGuardHome into the /opt/ directory
mv /tmp/AGH.$RND1/AdGuardHome /opt/

# Move file in repo to /etc/init.d/AdGuardHome
mv ./AdGuardHome /etc/init.d/AdGuardHome

rc-update add AdGuardHome
rc-update AdGuardHome start

echo "Done!"
echo "Configure AdGuard URL by accessing it here at http://127.0.0.1:3000 or by its ip address!"
