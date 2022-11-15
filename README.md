# AdGuard Home on Alpine Linux script
This is a script that auto installs AdGuard Home to the /opt/ directory. It was created to easily deploy AdGuard Home on an Alpin Linux LXC container.

The AdGuardHome script was created by Vlad, his website can be found [here](https://vladislav.xyz/posts/adguard-on-alpine-linux/).

# Instructions

NOTE: This script was designed to be run as root. Some of the commands may not run on an account without root priviledges.

Clone the repo
`git clone https://github.com/angelsanchez312/adguard-alpine.git`

Change into the repository's directory
`cd adguard-alpine`

Make the script executable
`chmod +x ./adguardhome-alpine.sh`

Run the script
./adguardhome-alpine.sh
