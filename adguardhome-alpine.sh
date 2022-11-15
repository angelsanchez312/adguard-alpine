#!/bin/ash
# Requires git
echo "Enter the url for the latest AdGuard Home release "
echo "You can find the latest version here from https://github.com/AdguardTeam/AdGuardHome/releases"
ARCH=$(uname -m)
echo "uname -m lists your architecture as " $ARCH
read aghurl
#aghurl=https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.108.0-b.21/AdGuardHome_linux_amd64.tar.gz
RND1=$$

# Get and extract archive from tmp folder
mkdir -p /tmp/AGH.$RND1/
wget -P /tmp/AGH.$RND1/ $aghurl 
tar -xf /tmp/AGH.$RND1/AdGuardHome*.tar.gz --directory /tmp/AGH.$RND1/

# Move AdGuardHome directory into the /opt/ directory
cp -R /tmp/AGH.$RND1/AdGuardHome/ /opt/

# Move file in repo to /etc/init.d/AdGuardHome
cp ./AdGuardHome.txt /etc/init.d/AdGuardHome

# Making AdGuardHome executable
chmod +x /etc/init.d/AdGuardHome

rc-update add AdGuardHome
rc-service AdGuardHome start

echo "Done!"
echo "Configure AdGuard URL by accessing it here at http://127.0.0.1:3000 or by its ip address!"

#https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.108.0-b.21/AdGuardHome_linux_amd64.tar.gz
