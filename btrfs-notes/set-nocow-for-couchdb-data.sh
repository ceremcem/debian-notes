#!/bin/bash
set -eu

curr="$1" # eg. /var/lib/couchdb
new="$curr.new"

[[ $(whoami) = "root" ]] || exec sudo "$0" "$@"

[[ -d "$curr" ]] || { echo "No such directory is found: $curr"; exit 1; }

if lsattr $curr -a | grep /\.$ | grep -- "-C-" > /dev/null; then
    echo "CoW is already disabled for $curr. Doing nothing."
    exit 0
fi
systemctl stop couchdb || true
mkdir "$new"
mv "$curr"/* "$new"
chattr +C "$curr"
rsync -avxHAX --info=progress2 $new/ $curr/
systemctl start couchdb || true

echo "---------------------------------------------"
echo "Changes made successfully."
echo "You can delete $curr.new if everything works correctly."
echo "---------------------------------------------"
