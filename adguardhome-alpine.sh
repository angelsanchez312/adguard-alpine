#!/bin/ash

echo "Enter the url for the latest AdGuard Home release "
echo "You can find the latest version here: "
echo "https://github.com/AdguardTeam/AdGuardHome/releases"
ARCH=$(uname -r)
echo "uname -m lists your architecture as " $ARCH
read aghurl


# Extract archive from tmp folder
mkdir -p ./AGH/
wget -P ./AGH/ $aghurl 
tar -xf ./AGH/*.tar.gz

# Move AdGuardHome into the /opt/ directory
cp -r ./AGH/AdGuardHome /opt/

# Move file in repo to /etc/init.d/AdGuardHome
cp ./AdGuardHome /etc/init.d/AdGuardHome

rc-update add AdGuardHome
rc-update AdGuardHome start

echo "Done!"
echo "Configure AdGuard URL by accessing it here at http://127.0.0.1:3000 or by its ip address!"
